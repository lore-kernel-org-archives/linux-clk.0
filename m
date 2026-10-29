Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257865;
	b=oCTwxKXgfl5NpihUDDE/hHZ6/GHFcDw8T474Neu3I5SVtFwNzPYStYd9/UnRbQkYi6sJ
	 Xew1YjCOku3mskZU9UYS8J14YOrATSPoJ+4DuhdLXqIhIZGuNsVpHFhBvZ6FqPsoT+VeT
	 owh1dRwaET1AjUQQKagPRb6OLxRcjVyHxIdFcv2bO/YifX2Rb7IIyeJZo7MZbnwmXIxXg
	 XtpRtZVME+n8m9Hsc0ikpu5DjhaMDZI8aKv67ZUKvE9RokHlR9O2aMaDWQOwiQaTvQjes
	 TyvFiVM+1IQ6Y8E7TBovX0jGE/QtSnZDzgFVsWcr+Gzdg8d49iMTFmMVnz+xHd7iY4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257865;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OMlJ0i5X/osWTaC+XBX9eeplDa1Ag1RtC+/YH9bezOo=;
	b=u/pTFCoZT0YXn3AFm09fc92zGFgPtCuB6YXJWEWzmDeh3PBZ4wgjRvWu8aPpBGvCwTTU
	 gpxMtuSC0u8vLYeMMISY6DxP7ymEmrlklh3UgYhqZpYTfjPxDGMIkveqizswni6vILPIU
	 /AEhDTM21Clbz4UW84MthHUdNcUT34+bcuZJ8/LWAJt6scMqadgtLJhQYj/WKyucivHoB
	 YGWWc9MIj8jq8IyCMxIFBbS1YcKYN5yciRZsjpblnyQw2c16YdPwy51Nb7M2Jkv3HebvG
	 tZoeSHkNxDHP0YZrTlMe6UULW4tlx5k9EUSSLmDYaGhvAzIS2cNYBP18tkw1GnX0XRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzOvEivV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F87606A31D;
	Thu, 29 Oct 2026 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzOvEivV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323C61F01825;
	Thu, 29 Oct 2026 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793257864;
	bh=OMlJ0i5X/osWTaC+XBX9eeplDa1Ag1RtC+/YH9bezOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UzOvEivV17QUJ1Xefa5yMts7TJY5FYtmzK0UcEja7u/JZ2rXi7UnOvqdRalhyqmBJ
	 dM9YsJBkBDuPHcLiplZtY+ApfpUz2lyDB72V8Rw5mwgzz76WPp4poCO4cZ1xSUGXhw
	 ytY08wyrzCRfPedADoVYIBNTer2K6LfVPLJMyle/jXzP7Qw7EukAUH5Kkzx8CyTnRj
	 7xCgJEhLSffYioePG2RC0GsPSvtAszqtIbARKvIz2Ftop+B42DlxH+BWmDbnXsS9kz
	 aJlmJ8p/2/1XrcsTa/kK25QATckcWwAOCeRt7/NvLXshx1Rl1A+AUAMGiJdZTXIr9F
	 taEBHEXzzik8w==
Message-ID: <sashiko-outbox-188839@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v11 4/5] dt-bindings: cpufreq: qcom-hw: Document
 SM7250 cpufreq hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-master-v11-4-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
 <20261029-master-v11-4-2c29e382162c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:11:03 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: cpufreq: missing allOf constraints for qcom,sm7250-=
cpufreq-hw
--

commit 623b16fc0e86cc72b884cb60a98bee234109660b
Author: Sreeshankar K <sreeshankar0910@gmail.com>

dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware

This commit adds the qcom,sm7250-cpufreq-hw compatible string to the Qualco=
mm
cpufreq hardware Device Tree binding schema.

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
Should qcom,sm7250-cpufreq-hw also be added to one of the allOf conditional
blocks in Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml?

In this binding, the top-level definitions of reg, reg-names, interrupts, a=
nd
interrupt-names allow anywhere from 1 to 4 items. Every other SoC-specific
compatible string is listed in an allOf if-then block to constrain minItems
and maxItems for those properties to match the exact number of frequency
domains and interrupts on that SoC:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,sm8150-cpufreq-hw
    then:
      properties:
        reg:
          minItems: 3
          maxItems: 3
        ...

Without an allOf entry for qcom,sm7250-cpufreq-hw, device tree nodes matchi=
ng
qcom,sm7250-cpufreq-hw will leave reg, reg-names, interrupts, and
interrupt-names unconstrained between 1 and 4 items during schema validatio=
n.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-master-v11=
-0-2c29e382162c@gmail.com?part=3D4
