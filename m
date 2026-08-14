Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B795441DE0E;
	Fri, 14 Aug 2026 07:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693487; cv=none; b=JlhuFLgnWrB96fYyfpS0JRg5hsNZOH2yaB1xDI9qZiizs9rvJIH662fX/LKiHSwCvw0+Ti6qLsgPpz/066+VzIgzCc//98WmEE1h+scOlY4YnQhk28Q8uJwCWLlJ9yirdX3EQ21mqpY1z6DoE/7iuTMXyywj/m7kbxqXz13Twkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693487; c=relaxed/simple;
	bh=M7vC4IJvUcJJCVj5ml8AXiobGlaDf6QhxnqfBaPlsUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NoHVITnWQuQt9lY4n+/PiUUUDySAMUTugaTiZ6vWCougRyCKfrIgZdiyp3VL44s1g0+ekGkqqg3FCt1XrOar4U2YZGf5djTKYR12IB5hsovY9COWERqg/3p/YWinArZeLXATXVxNsikBpzjsUWaVlmU0fTZ/uwmB4KWgMq8RSTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbXd0tUV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbXd0tUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0F01F000E9;
	Fri, 14 Aug 2026 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786693476;
	bh=8YevNzG70neo/3mV1CkyJOCNxJ46tGxeH6kFeCy7hIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbXd0tUVAugiey3YopdhY5m3wXBLVNLSa/L/Lu5q3OxrcKM8s/HS0+hSKNcbE216P
	 4IcvmCGCiKsJ7hQPF3sIBWOxabXCDBwzwo98tztLAsYA1pbPvXJ/EVA3ohEnUlmb/r
	 QppdERNTYGhQvAOCigpSTdu612ul3uFox4EXMQ9LAZymyu3+XEcKsqd+Nqqykp4PrD
	 p5ldDd4mC/QlgfB6rr/59CgM+afZRjVx0+I0dQuP8vRNRhHm/ojdeHvjczski7NWPl
	 6Q5qTT0ZciyjKvxNkD6QdVrM8zrto5DHRiM4SaIIM0EHt+pR12hidQK4cUXBQ2oyC9
	 3KPEbUYZPhG/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/15] dt-bindings: firmware: qcom,scm: Document SCM
 on Kuno SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260814-kuno-soc-support-v2-13-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-13-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:44:35 +0000
Message-Id: <20260814074436.3E0F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing 'qcom,scm-kuno' in the interrupts conditional block of the =
qcom,scm schema.
--

--- Patch [13]: [PATCH v2 13/15] dt-bindings: firmware: qcom,scm: Document =
SCM on Kuno SoC ---
commit 3c4b97f23fe59957f3113cdee2e0d2333d4ba10b
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/D=
ocumentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 037d4ad8f718d..ecee5aef65a7b 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -37,6 +37,7 @@ properties:
>            - qcom,scm-ipq9574
>            - qcom,scm-ipq9650
>            - qcom,scm-kaanapali
> +          - qcom,scm-kuno
>            - qcom,scm-maili
>            - qcom,scm-mdm9607
>            - qcom,scm-milos

[Severity: Low]
Does this compatible string also need to be added to the interrupts conditi=
onal
block further down in the file?

If Kuno hardware supports wait-queue interrupts like the parallel Kaanapali
and Maili generations do, omitting it from the allOf interrupts block will
cause a schema validation regression:

allOf:
  # Interrupts
  - if:
      not:
        properties:
          compatible:
            contains:
              enum:
                - qcom,scm-eliza
                - qcom,scm-hawi
                - qcom,scm-kaanapali
                - qcom,scm-maili
                ...
    then:
      properties:
        interrupts: false

Can qcom,scm-kuno be added to this enum list to ensure device trees using t=
he
wait-queue interrupt pass dt_binding_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-kuno-soc-s=
upport-v2-0-3079794f0f73@oss.qualcomm.com?part=3D13
