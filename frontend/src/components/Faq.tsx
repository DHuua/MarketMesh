interface FAQItem {
  q: string;
  a: string;
}

const faqs: FAQItem[] = [
  { q: "What formats are supported?", a: "GLTF, OBJ, FBX with PBR textures supported." },
  { q: "Can I host private assets?", a: "Yes — teams can set visibility and license rules per asset." },
  { q: "Is there an API?", a: "Yes, REST API + CLI for uploads, downloads, and metadata." },
  { q: "Does MeshMarket generate LODs?", a: "Automatic LOD generation and mesh simplification are available." },
  { q: "How are assets previewed?", a: "In-browser with PBR rendering and camera controls." },
  { q: "What about pricing?", a: "We provide free tier and paid plans; see pricing for details." },
];

type Props = {}

const Faq = (props: Props) => {
  return (
    <section className="py-12 md:py-20 bg-white">
      <div className="container-max">
        <h2 className="text-2xl font-bold text-gray-900">FAQ</h2>
        <div className="mt-6 grid grid-cols-1 md:grid-cols-2 gap-6">
          {faqs.map((f, i) => (
            <div key={i} className="p-5 border rounded-lg bg-gray-50">
              <h3 className="font-semibold text-gray-800">{f.q}</h3>
              <p className="mt-2 text-gray-600 text-sm">{f.a}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

export default Faq