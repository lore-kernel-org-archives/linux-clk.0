Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0BC385D99;
	Fri, 16 Oct 2026 04:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125166; cv=none; b=XGkYs6v8OFPRUyGo/JXizEGqtbCnJvDwaW9vKekx/R10Zv3tDgt6yFhReLfQG0w5GIsUwAEfFwVYw5NwggBeJI0G/QjQrJUr7LXliMFDf9L9RBOHDsmqjmC9Gi5XlgvVRuD6gDIcJOCNauWrMEj5G9eoQp2EApDN3LfueiJSqW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125166; c=relaxed/simple;
	bh=o12cebP1myZsQrq3B6eNqyG7BXDovC/2M4X1s7+ucN8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bJMQq6NtXL/IwtAPyaOUgtwatI7CrzgmYp6U2qemPPeytJDCRO6/Aq0PDg6CM5kdsUyKaTOVVOVDwlPptFVjUN5MN0oeC7+EL2/ViJbOSQyYfAd33vyb/ELAuyZ+a//d8oelmGtO4IAqKidop9orh471+6dix3LlMH2mx27CyhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3dh3C0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3dh3C0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C911F000C4;
	Fri, 16 Oct 2026 04:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792125164;
	bh=q0vNzXG/ccbeWBNLLxXEZ6EN5CDJ5sMBDWSkNwmcFNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i3dh3C0gzj+LKyWIlQzz6a/9hPSZeWRw2sRtOANDQmxDU7v1NeKC8XcEoCuprWlu9
	 dKaQCensr8x7x/4WGElDo2Ov0soT0hJEsWfn6589K/SGA2Cfq8srk0XIvWjyF7wknz
	 AGcgSI192B6lhTNnN9EX/I6MXFnAXskFtHzfDhm2wIYIw1jrSudpnaZY1ol4mLJ2Q/
	 t8YCShw9uD146obSBZey9yQQYv6373bDY2xwX1hdofFAtrUEK8yMlulPzNie++s4Kz
	 385NNXlnBo2ddsJ/x0/ffMs2XQQeF4r4eU4a/HflFZjpQNAeMB2DFqSCtNJcXyZziu
	 TKd3p61bI4a3A==
Message-ID: <sashiko-outbox-173787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/5] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016042432.824-5-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
 <20261016042432.824-5-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:32:44 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: cpufreq: qcom-hw: missing SM7250 in schema conditio=
nals
--

commit 7eca354281cb4ab83cc6aed6ad713ee095a5b71a
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
Should this new compatible string also be propagated to the hardware-specif=
ic
conditionals in the allOf block?

If the new compatible string is omitted from the conditional blocks, schema
validation for qcom,sm7250-cpufreq-hw will fall back to the top-level bound=
s.
Device trees with incorrect register or interrupt configurations will pass
validation.

Since the SM7250 has 3 register domains, should it be added to the constrai=
nt
block enforcing exactly 3 items?

Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml:allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,milos-cpufreq-epss
              - qcom,qcs8300-cpufreq-epss
              - qcom,sc7280-cpufreq-epss
              - qcom,sm8250-cpufreq-epss
              - qcom,sm8350-cpufreq-epss
              - qcom,sm8450-cpufreq-epss
              - qcom,sm8550-cpufreq-epss
    then:
      properties:
        reg:
          minItems: 3
          maxItems: 3

>                - qcom,sm8150-cpufreq-hw
>            - const: qcom,cpufreq-hw
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016042432.824-=
1-sreeshankar0910@gmail.com?part=3D4
