-- CreateTable
CREATE TABLE "ManipulationArea" (
    "id" SERIAL NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "manipulationArea" INTEGER NOT NULL,

    CONSTRAINT "ManipulationArea_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ManipulationArea_manipulationArea_key" ON "ManipulationArea"("manipulationArea");

-- AddForeignKey
ALTER TABLE "ManipulationArea" ADD CONSTRAINT "ManipulationArea_manipulationArea_fkey" FOREIGN KEY ("manipulationArea") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;
