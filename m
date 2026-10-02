Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939B4CB8AC;
	Fri,  2 Oct 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950854; cv=none; b=PKnyfzH3cB+v61lykxfWd2Pb9EIRj6RsSmVfaj4FLmHYxtq6iydg8iyJk1fmHvhfl2ICSt67usaqmP4GsgodEw9i8oWiHn71DP6L15pQk6IBjanZpBRKnS+GAsfM/BQX7SfnXJOshbboFQgypBZ2Ayn2YOfXTUBCvMJT0lxvdxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950854; c=relaxed/simple;
	bh=rmRb2qaWp/uSrc8GYUXt4cd/nBy8xOohI2j38K0pI2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ft1pCWmWw26ohN9kTB5YQ/Esx5B/HLvFocCd8VwpiN0aDrepIvhNxtGanZxInEhv3GIk04rXfdTss7qrAsEl3xG39ToJjXW9hiLZGFt66wlPDSJtL4kmOqmQvYVstT/Ff2ywObr5zV9F6erfMU9Zhfrk79FooRXW8/vsG3YioNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2T3YqoP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2T3YqoP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD271F000FF;
	Fri,  2 Oct 2026 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790950852;
	bh=wqxG067fIx1Nn5UiMA58ogRrwwoZqDE28HXM7L2RTC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H2T3YqoPNgR5xDEYxLiTa1ZMYln6KHLMMM2TwaVEAeytmGujk5KHne1XSblPxEDCO
	 yxxJHjOpAWy+L4JJcHLK2ZYccu4GNNXwg/0+/3aiRq0mgKHvePHuUvy801PRc6IEzY
	 lqHDUZ3qb+KR1OQc05QIIN9miVEs+IG5yMnojhCOuQ2z6k/9fVkUdVrf9gd4MGB9yU
	 sX+1uC23Ql+SMKTsV5qlwySLSEFn9Qzjr1XsRtABbvPdwWKdOTTvfJa1NHdzyXcXEs
	 jwU0+94M7++RQiVw1bpxKVSPWtcuZudqexeaPCHg+Bw3SjAEzlX51BVVTuOj30pLuK
	 lrNryYpZn/eGg==
Date: Fri, 2 Oct 2026 09:20:50 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: Convert HiSilicon clocks to DT schema
Message-ID: <20261002142050.GB1579700-robh@kernel.org>
References: <20261001212051.2227941-1-robh@kernel.org>
 <20261002091350.895461F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002091350.895461F00899@smtp.kernel.org>

On Fri, Oct 02, 2026 at 09:13:50AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dt-bindings: missing if-then constraints for stub clock properties
> - [Low] dt-bindings: YAML conversion dropped all DT examples
> --
> 
> commit 9d6ccc9389906ef23ff428ed84de04603566232a
> Author: Rob Herring (Arm) <robh@kernel.org>
> Date:   Thu Oct 1 21:20:48 2026 +0000
> 
>     dt-bindings: clock: Convert HiSilicon clocks to DT schema
> 
> This commit converts the HiSilicon Hi6220, Hi3660, and Hi3670 clock
> bindings from legacy text format to YAML DT schema format. It also
> splits out the stub clock binding into its own standalone document.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml b/Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml
> > new file mode 100644
> > index 0000000000000..345c6d0e7a134
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/hisilicon,clocks.yaml
> 
> [ ... ]
> 
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#clock-cells'
> > +
> > +additionalProperties: false
> 
> [Severity: Low]
> Were the device tree examples intentionally omitted during the conversion?

Yes. The binding is trivial.

> The original hi3660-clock.txt and hi3670-clock.txt bindings included example
> nodes, but they have been dropped entirely here. Running make dt_binding_check
> will only validate the schema syntax itself, but without an examples block, it
> will not validate any real configurations. This circumvents the primary
> self-testing mechanism of the schema conversion.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.yaml b/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.yaml
> > new file mode 100644
> > index 0000000000000..4dd6a01bfd9db
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/hisilicon,hi6220-stub-clk.yaml
> 
> [ ... ]
> 
> > +required:
> > +  - compatible
> > +  - '#clock-cells'
> > +  - mboxes
> 
> [Severity: Medium]
> Should there be conditional (if-then) constraints here to enforce
> hardware-specific requirements?

No. These are old, hardly maintained devices with no new platforms 
being added. It just doesn't matter here.

Rob
