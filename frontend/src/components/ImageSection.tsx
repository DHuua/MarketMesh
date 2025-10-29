import React from 'react'

type Props = {}

const ImageSection = (props: Props) => {
  return (
    <section className="py-12 md:py-20">
        <div className="container-max">
        <div className="rounded-lg overflow-hidden shadow-lg">
            <img
            src="https://images.unsplash.com/photo-1503602642458-232111445657?q=80&w=1600&auto=format&fit=crop"
            alt="large showcase"
            className="w-full object-cover h-72 md:h-96 lg:h-[520px]"
            />
        </div>
        </div>
    </section>
  )
}

export default ImageSection