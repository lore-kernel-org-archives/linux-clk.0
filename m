Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0585D35E950;
	Thu, 15 Oct 2026 05:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041974; cv=none; b=az6EO00I0ePMRgVo6KIqeU3RN/akNZ8Qx91k1wrQ64SFjpOoP7+Pb3iSEh4v4myPQEpHCHY96fJlg5wx7cQabPEKbWMUxz4221BRRcZyeTgV87o++XQ4v+qvNPdcmmyc45oDEUzlul1ViUvJ/xJYlKnG+0mh6/UzJKkbw70U4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041974; c=relaxed/simple;
	bh=n+kImsj2W0CTkSFcXmwWpPUYuNo10vGWk2IJSfUTjIA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dHAE3fMeRGhfuy3lmx3ybrL894UK6e9t5t6rF8Da5605le9Uk6QzyJ5a/MNt2veHxrvqv9m3Dqy7Zpq/PtyCg9BDOj+MmdOGH1z+B21dniCNReiVc9P4zSjnlk9hb74aULt1eKbUgNDuY21kA9WaZT6dcbnu5qBvCR7Ket91rOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQFBHKUu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQFBHKUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072821F000C4;
	Thu, 15 Oct 2026 05:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792041973;
	bh=1LmU6aZodSZy8MBqqZGfVwfRFR4p1RhOpROzgztwjo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZQFBHKUu3fnbekqa+QiDx/2UnIwrD1E1AWjqIpc62roz7zpKWr8+PODhvvB+R1U/p
	 PhX4HGFJLq5wB/DnEnxbbpDXYbx5VIyPfJi42v36yeMuNGEu318D7AQKoLIYebRYjf
	 H1XJllKlrQtUyuR8bqqoceXOcoXwlq41iOiP2YWsBInkNTXcEYPCQP42C1LQkLLNzk
	 kXSFHPBis5Ki6pD8FCjuXNz1GusLklIOlcnCGgRFcjAvhaI3sdxQX25N86BBFIwhU+
	 Nt3NxSFlvnTfBdUfqB3g3Hg6yLgJ8S+KIqcjhgOeX9vnXbHgPYx9o7J5RkL6Yg5FJs
	 z20BHCFpdgZjQ==
Message-ID: <sashiko-outbox-172305@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/6] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015051926.13752-6-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
 <20261015051926.13752-6-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 05:26:12 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: missing allOf conditional constraint for qcom,sm725=
0-cpufreq-hw
--

commit 98b8b2444ed3f6041afd44a3665350b379c6ffc1
Author: Sreeshankar K <sreeshankar0910@gmail.com>

dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware

Document the cpufreq hardware on the SM7250 SoC.

> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.ya=
ml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 98eb36bff1727..2dc2c265cac06 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,sdm845-cpufreq-hw
>                - qcom,sm6115-cpufreq-hw
>                - qcom,sm6350-cpufreq-hw
> +              - qcom,sm7250-cpufreq-hw

[Severity: Medium]
Does qcom,sm7250-cpufreq-hw also need to be added to the allOf conditional
blocks later in the file?

This binding schema strictly enforces constraints like the number of regist=
ers
(reg, reg-names) and interrupts (interrupts, interrupt-names) based on the
exact SoC variant using if-then blocks.

Because qcom,sm7250-cpufreq-hw is omitted from those conditionals, device
trees for the SM7250 variant might silently pass schema validation even if
they contain an incorrect number of registers or interrupts.

>                - qcom,sm8150-cpufreq-hw
>            - const: qcom,cpufreq-hw
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015051926.1375=
2-2-sreeshankar0910@gmail.com?part=3D5
