Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA2B430CE5
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439765; cv=none; b=AvVFpiqhz96rJeIfoeUT9R8SFOCx0pwZI37CCC5wnXOh07x+rBmESjyVV9zcJdzG8H14fmPZEkLdGBnkThGfTcv2b3cohy/u+sybGJY/cv2Pkp5crhWTXx3n0DEFyDITO7Oy8lYIb61GiCU8KRFdZ8jyysKxi7V52ZRZs+i0fMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439765; c=relaxed/simple;
	bh=qSzv8jH9j8nQ7HSLLTeJpPBXJDM5auvvcSeZ/2BG/ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4iW8eZti0tg7cac/He95ByRNFI0cerBWvFhZ14lUSICC24/0Ojzjw+6nsnaj8IPNgCcsBfyJiDSFtEVd3imF/tcKbzM8+vv1ybDCOWgqaY1N+/xuD05YPiSw2U53VxZ3nvFR4Olub3qHSCf03YX+iCF0/sUxyZiE2Gw9dV9wNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oo/rJf0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oo/rJf0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDC61F000E9
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783439763;
	bh=XpJw9io3fjRgOtK6zLaiSswWKuLmK0PDRcOfWIbbXcQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oo/rJf0uf6OMgy41BoztRw2fjxk2SuE82lnxffdIEestTRKZDqKTqwPvvxqDcu6nn
	 BNWNwcUK0TJGGMPej+yLme/eKMYAhFJbH293jMupnNdwJhQ65PKQLLiebaRQcozJ/D
	 wwWH+FZzSf4VUBxeIhXEfPPQskDp3NmgkcXAGfFxzeHWBbZ+x4JzUCyR2L9HyjI3HT
	 zyidrUTrKjwXGVRGt+VOtC2XE8XPsKDAS/OA/B5yqrVwYK/peikLEMRtNwfn0chAoa
	 aNYdljRvMJM5RFYO3cj+b19Rk7YVMOpWd8Qg3TYGDmMI3SlVmkGGTvLT0Zjlrg/A1g
	 eNFGZ09T8am8A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1276b8c7e2so447244666b.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 08:56:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rohekjt/uJzoczR5DIY//JP7HKU4NZG0BypdzPwrmQmsMhC8yEh/pHqW+kufSnaDFci5ASFj5LRDYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLk2mWq6XLS5oiDDEovoaFsUP7OhLRXV6E3iOSjFobmZLsy5i8
	6p7EeP3SAbjtVBuiKspnzf4jQtgdXvVWOxAOa5QFzVmNl90aYy2tUZiybGUML8TnDnseTrZBAel
	ukVOHNIc1O64YtQID7Pbdj5i/huwW7g==
X-Received: by 2002:a17:907:3e28:b0:c12:e178:9e96 with SMTP id
 a640c23a62f3a-c15a6797765mr356272766b.14.1783439762253; Tue, 07 Jul 2026
 08:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780499520.git.michal.simek@amd.com> <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
In-Reply-To: <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Jul 2026 10:55:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
X-Gm-Features: AVVi8CeWMVmr9b-fYHQTlYbUaXSASdllAjeebeVjmBQkRgnkHGGocV2Uv5Xxhd0
Message-ID: <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 10:12=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
>
> The ZynqMP clock controller binding shares only #clock-cells with the
> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
> Also remove "(Optional clock)" from clock description because it is visib=
le
> from schema itself.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
> Changes in v3:
> - Cover change in zynqmp-firmware.yaml
> - Move clock-cells to be the last in the example
> - Remove comment around (Optional clock) which is obvious from schema
>   itself
>
> Changes in v2:
> - New patch in series
> - Split zynqmp-clk from versal-clk
>
>  .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
>  .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
>  3 files changed, 76 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-c=
lk.yaml

This is now causing warnings in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware):
clock-controller:clock-names:0: 'pss_ref_clk' was expected
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware):
clock-controller:clock-names:1: 'video_clk' was expected
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:
['ref', 'pl_alt_ref'] is too short
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clocks:
[[4294967295], [4294967295]] is too short
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:compatible:0:
'xlnx,zynqmp-clk' was expected
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
