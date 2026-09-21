Received: from mta1.migadu.com (out-240.mta1.migadu.com [95.215.58.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361E948F02B
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989382; cv=none; b=UyI050SF4oQEb4JcVjURPALRifPOuOdTs9G6QDDLsD0pUtmICfKpU4bpANUu5YeGfxkFZbbFRpi4j1e8tSgxLWJklreMlCHFkq0TUQNE91Z4EbndkuOgiofo9zLiGF0kK1uteUj1NJMGpslYtTSoR6V8CpIzZmIm3T7nQ03uQqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989382; c=relaxed/simple;
	bh=gatQIgMu3v/IsMUVrYP5QjjizymHE9HTRW55gqqQDXU=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=KpWyzFI4YzRhNOn1rmgw8fJMOjMg59rLpiLqWBsufYm93qFqIc/uQ+fOypVC8zVe3rtH6wOGSYEDWskA4NKfdPnIc3eBhc/ddU2LxpiGxyKanynNLsWY29Rrj339ow1uYG7qigmoCG2csJjJQrba6TxSygTBtTLM8HzQxGLGPZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ah2ILXlJ; arc=none smtp.client-ip=95.215.58.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ah2ILXlJ"
X-Envelope-To: linux-clk@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gatQIgMu3v/IsMUVrYP5QjjizymHE9HTRW55gqqQDXU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789989377; v=1; x=1790594177;
 b=Ah2ILXlJUiKmMBQ1B/wLli2UkwdnNt4Qa+mxodmPSWcyTrLObSoJRJF1Dy4SpeONenSkSuyd
 2oEAlmsNg4E9NeLNx0OoxjKhbzo5mUU+ObrfGPgu1UpcWiGkB2PgBkFyNIIm15DrankoS2e6zu/
 wyWp5ShFZ9eamQ8BRyRJH2rs=
X-Envelope-To: linux-clk@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 89478576c1541826;
	Mon, 21 Sep 2026 11:16:16 +0000
X-Mizu-Trace-ID: 89478576c1541826
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 11:16:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <6b691a27f27eee1a058426cc7fd5a3fbdbfd45a6@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 1/2] clk: mediatek: mt7988: keep combo-lane U3 PHY ref
 clock enabled
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Frank Wunderlich" <linux@fw-web.de>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Mathias Nyman" <mathias.nyman@intel.com>, "Chunfeng Yun"
 <chunfeng.yun@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Daniel Golle"
 <daniel@makrotopia.org>, "Mihai Ordean" <research@mihaiordean.com>,
 "Chen-Yu Tsai" <wenst@chromium.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
In-Reply-To: <a71b6552-ea57-4575-89e1-14d414d53569@collabora.com>
References: <20260919114744.46777-1-linux@fw-web.de>
 <20260919114744.46777-2-linux@fw-web.de>
 <a71b6552-ea57-4575-89e1-14d414d53569@collabora.com>

Am 21. September 2026 um 11:59 schrieb "AngeloGioacchino Del Regno" <ange=
logioacchino.delregno@collabora.com>:

Hi angelo

> On 9/19/26 13:47, Frank Wunderlich wrote:
>=20
>=20>=20
>=20> From: Mihai Ordean <research@mihaiordean.com>
> >  CLK_INFRA_USB_PIPE is the reference clock of xphyu3port0, the U3/PCI=
e
> >  combo serdes. On MT7988 that lane is shared between ssusb0's SuperSp=
eed
> >  side and pcie2, but only the consumer that claims the PHY holds the =
gate.
> >  On the BPI-R4 Pro, ssusb0 is configured USB2-only (u3p-dis-msk=3D1) =
and
> >  pcie2 claims the lane for the CN13/CN15 M.2 slot, so pcie2 is the so=
le
> >  holder. u3p-dis-msk does not remove ssusb0's SuperSpeed root hub: th=
at is
> >  decided by xhci_has_one_roothub(), which keys off usb3_rhub.num_port=
s
> >  from the xHCI capability registers, so bus 2 is registered and live
> >  regardless. When the M.2 slot is empty, pcie2 fails link training (-=
110)
> >  and its error path calls phy_power_off()/phy_exit(), which gates thi=
s
> >  clock - and sspxtp_sel with it, as nothing else consumes it. The sti=
ll
> >  registered SuperSpeed root hub is then left polling a serdes whose P=
HY
> >  reference clock has just stopped,
> >=20
>=20I'm not sure why said clock cannot be assigned to the USB controller =
as well
> as the PCIe PHY to keep the refcount high, avoiding to gate it?

the clock is assigned to the phy which is assigned to both consumers

mt7988a.dtsi:

		xsphy: xs-phy@11e10000 {
			compatible =3D "mediatek,mt7988-xsphy",
				     "mediatek,xsphy";
			...

			xphyu3port0: usb-phy@3400 {
				reg =3D <0x3400 0x500>;
				clocks =3D <&infracfg CLK_INFRA_USB_PIPE>;

		ssusb0: usb@11190000 {
			compatible =3D "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
			...
			phys =3D <&xphyu2port0 PHY_TYPE_USB2>,
			       <&xphyu3port0 PHY_TYPE_USB3>;
		};

		pcie2: pcie@11280000 {
			compatible =3D "mediatek,mt7986-pcie",
				     "mediatek,mt8192-pcie";
			...

			phys =3D <&xphyu3port0 PHY_TYPE_PCIE>;
			phy-names =3D "pcie-phy";
			...
		};

but this seems not enough...do you mean we need to define the clock again=
 for both
consumers (e.g. via assigned-clock-parents property)?

regards Frank

> Cheers,
> Angelo
>=20
>=20>=20
>=20> and asserts the shared SSUSB interrupt
> >  outside the xHCI event ring; xhci_irq() reads USBSTS with EINT clear=
 and
> >  returns IRQ_NONE, so the core disables the line ("nobody cared") and=
 the
> >  next USB teardown blocks forever in xhci_disable_slot().
> >  Boot logs show the storm threshold being crossed 86-107 ms after the
> >  pcie2 probe failure, while the earlier combo-mux switch to PCIe mode
> >  (~550 ms before) causes no trouble, pointing at the clock gating rat=
her
> >  than the mux as the trigger.
> >  Mark the gate CLK_IS_CRITICAL so the combo lane keeps its reference =
clock.
> >  Only port 0's gate is affected; ssusb1 uses CLK_INFRA_USB_PIPE_CK_P1=
.
> >  Signed-off-by: Mihai Ordean <research@mihaiordean.com>
> >  Signed-off-by: Frank Wunderlich <frank-w@public-files.de>


regards Frank
