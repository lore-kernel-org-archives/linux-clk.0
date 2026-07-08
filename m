Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2033890F0
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514387; cv=pass; b=XzAxnEnALR7jfXnwgqrkf7i5TIVpC4f7kkfY6yqGM6bN6A+Rro31JEWZe7ixUGh6ohqdKqqyxkktohcWLrrypvb8LwcbH0jDJNdsrGruL9pPacOF7pZ7MmRUANTj8FCJeRvhZwVX1w/MYOxJ23eS14ewsvdDY/GzzmeiU3QT6R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514387; c=relaxed/simple;
	bh=n/sGbbutQ73G342dpin2WL8qTmPSXEGKF9D4zc1iiXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Us6mdyyZNcgwcVRb8DEPUwV2s+kezHBv3llcT611Pw53uI13KbnTlaZbfpiPVNTqH8iBPAzCGJXSK4NsuNaQvU1KDUwhuqMhD3EY39B88kw4xQWESBTfZyMsuiysNm6d0qYWp4GE0D6hYg5pMfAxdhu4lcEfrBdhPfEdOVkUjy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMutdXuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ja3UGPQB; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMutdXuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ja3UGPQB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C40ux2759993
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 12:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=; b=WMutdXuMbVkKPC/j
	6HN9SqXaZSnN4OtWCnX8k4AsDfDfx9zvXEslzfZbDuBENNg8QNebTMaBz/dFqB1m
	OHhP5nD5UhVqtDryA283LgRfFPUFnRtp8tQiVuTITPeP1QamoPF1xuIHG+oA39Ri
	Pir7o6URI7gqHvWJFOv0H/qBblZNpDNvzkji4i4HEm1oG3o7qQ7kBMRpK5Djvwg5
	/oDq79tqVMuUDBGiJQB6sC+hgxrAoLAikyi3xWNseZ2+8+8ZmbItTvMf7H6A2AK2
	16niAirL4jz45iWfDJ20W51WL3f8c4c6//WmPFK7pvxGJF2Y3C9p/fkgnc0cMs0r
	Qe56ZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5vdwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 12:39:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ec45d9628aso15288486d6.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 05:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514384; cv=none;
        d=google.com; s=arc-20260327;
        b=CkIsOP9hu8KaCNhfFJ5dxzNBcs6LwUc8LGMWv3rXBDH1icZgKeckWSdmKrmC7rzYJQ
         zqiMXuM9oyHOsNU+7D2Wkh0cXeLFaWwi0GZgukL+yIyBBCpa1n8gx5f1xr6wCEuqOXrA
         xI0dSTUITXM7tytUdmCYMYKVf5OOpc+1qG6JXHqkD2YgnlCE9QyCI2QTSKbFIM6zDAhN
         /PbhkYsuQHyDDFgYiilh3lc0N60ovR+o6mSNHd9iY78QMqpJ0y61FXl+5XQiGRTX8sC7
         cektmOviai5oxw0k9Kdr/HxlHXfke0AIK/ts0kAyMxz+drhgjz6+8D8mt3DX16mgvKVE
         FPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        fh=XrwOTiUHN8BDvvWEOld9jz6XimEJb8mMACs5O3HW6yo=;
        b=kgO5r8xjQGVYac4kp59g2EksI8qt7WNz+j+76Pu2tV8GCjVgu64LZGhSMcKQ8kbU3s
         +tN42hPA7jkjh9KtONnhQY/U5E3pq8Hq3HCiI+b8IeJyGAdI5znewjKb34J/wC6gwVPJ
         C839jkfSUH2ysaFBcvxQwaitG/rdRoIeOcbPpOP2lusGWgIpTISlIIaelGK7NtAIWq7b
         wxWolNq2GqYNGEvRRC23YJkgHsuzV9DxIkP2jH36mv3f/0Riuc3IrRoI29VDtrap/pjz
         gjlUzNHPDjVOCFCOhTWqbupLnxvcjzwr42g5ZFWeSDrsEVztevAUhdZ0OswKS0KWiEb5
         SqOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783514384; x=1784119184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        b=ja3UGPQB+LrSaE7IbXO7DRf+BBWAP0NenUr1rAbjQq1XdTWDtApLGJzjb01Bf3s6+7
         wjQABJfMnsB6GnMeLkoguC6MAojP2tVwDhAvnaeAncgZxsugijWzxXJnYQol0J9EfAvX
         fWUrKqWIy7pSFr9CiM7jv9GHRCJJ2qiEijb7Dv5Vx9OhnDqWeDP0xzg6nySyW1kuR9MV
         V7+6re3Xskw1jhABPwZ9jxuWQvDPuPdylhLOt6tT083pnxfITjAUhbp4ScrXEvsOF/xE
         7J/JOATgQB04h0oys+ybCGl+JJLsW7srPshDTP1TvBllz2EH+IfMUZSqojKRU1wI7+HO
         t6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514384; x=1784119184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVLrRsxBfsth/sld+RHhwkOWkl2LyTR8biIgWTqq5w0=;
        b=rB2FLxxwM8wH0CCVZKcgwyOCct1tRJK3fdsYTFBDoPZWFVfqY3fu11KcNjaaovjH3+
         GtYO8TLjOfrsyQAVWEGTaW7u4REeQEmXk0GZujXAu2zS/K/kWAt5G7xe7fh8WraKYzjW
         FdhncalpMbAyf90wkrTcOn63NGLfiO8bN2ymycorTEvU/fNg52RRg9UORYatk5rDvUNu
         +iGIJcrxFgLB4zlqyPCYowPj+qm0RipUmWC82w8wTEwlb+9+lkGbVVcKk4V2BUA0r0i0
         KRsOm8zN6VFjybxFfCQ7jwQV7MMWYCTHzSuFAwHoVAVd4rRNezs9sGvRqBOtRQxj2XF5
         0wCA==
X-Forwarded-Encrypted: i=1; AHgh+RrVCkeprdyjpxJX/YFay2LpLl6e4q48w7iifPAQ3VtzRdQV5iMXmUZgXfPBgnvx9vuijOZRZRQu1QA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuiXf8EKmd6UhoeA3ZD8DTP8+Dfq3Gf5MXvLwicZbpxv6kPIO2
	1QUS8hqJLSNfyYsJV9YEC8N7ch949w7Jw9yS+tL6lCpKaM8kdFHhL/BGos2LAI1yNA7+IHUxkZG
	F/EDbl1dXhU940OOKe3OTP1WgxQ3yaSVejjYJO7BKKg1563ZdaMJZIfBsEgG+aMAs31s1mWGjeH
	c8LrVdtSSogHBAVyBiKNplZ5YZAkx0scYglJSMvQ==
X-Gm-Gg: AfdE7cnlWVoU/9zE2N3Ox0WuK1V5WxCTv1irZXBDT7ZxE98nKAKAbIH+Qus4nvNnumX
	1TCf9m3VOcz6OMmYn1makgPgWyYoI6RK1mKkZgNvqKgGFSIOWcIhhl+GQuBydrlxjgaReBOYTyG
	Jn/wElQIYK1a59DtcMQNoqQykw4hKhSCW8oQuXLrckkIGkkxwWpcYqJ+jFdGFhNnrDB5YZMxuua
	+FSDfadwWEdQmBkL68o9/R/IXHfGGRzIsXsJKIISbfhRRP7Y9e5KxORO+0Hu8U5YmlZYj5GFr0n
	xvd0Bz6YvQ==
X-Received: by 2002:ad4:5f8a:0:b0:8fd:6dc5:946 with SMTP id 6a1803df08f44-8fec35246c7mr20100856d6.59.1783514384022;
        Wed, 08 Jul 2026 05:39:44 -0700 (PDT)
X-Received: by 2002:ad4:5f8a:0:b0:8fd:6dc5:946 with SMTP id
 6a1803df08f44-8fec35246c7mr20100466d6.59.1783514383642; Wed, 08 Jul 2026
 05:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:39:31 +0200
X-Gm-Features: AVVi8CchIqRSdmxO0bXp2YqtKRf6VLcwQniYXaK_pILrgpsztuik_wMDiAIIoR0
Message-ID: <CAFEp6-3-OZKpn-2WV8hKC5dsid9X-usjmiYLdYHeaDKqHGRonA@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: YCO2TNETU9PSYw0K-0g6_DO9ASStppA4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMyBTYWx0ZWRfX0jMg7TEUZ0Z1
 pUA3uBDDJc8837459Quy4BzysRaB7HOb9ret4FnbJQRB4GbH6BHjJAblZF5ESDMrCLSca65hyFQ
 pudbF0TQdHy933U4Pky8ZnX6R4cjQZs=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e4510 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_SFytyMYinpwrXg1NNAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YCO2TNETU9PSYw0K-0g6_DO9ASStppA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMyBTYWx0ZWRfX1M2XTBL8/Ldn
 aqlmU06yBDtTzDvyDa4ZL1qJOqDm50uNgRnxFQDseCn2n2e8kdyKWLao22oKbcc4ToAuU+E8ifh
 Jdhq2fMBJtprlkY/U+bZvFSedimdAT661I/MFxsiokWJpjXQbipmNlIk8Wvbom2+kaPKCDzsEXN
 HjW/imZ5BVFYRlLddD/f5dCp2JlStF2/EpsT56ebQ+WoPcFaL+FkgBW+YWM778jrZuRh1RB21il
 unZ0DTJZ3ShpkxxuRjAktZQv2AZ9YiGP+XdJTV2gnE3kD9xQDht7REzPSRKwDrEkBJfO8hF7o3S
 LtiyxBnc5H2n5InrVd6E7M9GjCsEE/HZsJqnUscQaVHbNF0YfkWVQ8pPyzXzyLDNm3jEDz1Oc2c
 D/tGvcSam/Z7gvPShGrz+CcU/FmMAgISyeGaoA2immPJoNZ98HhSRgivJKBgx5UNroaYCcf+zEo
 P2Bxq3MKvP0iodviJpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080123

On Wed, Jul 8, 2026 at 2:07=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The original iommus list included entries for ICP and BPS/IPE S1
> contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
> ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
> CDM IFE. The remaining entries serve other hardware blocks which will
> be described in their own nodes as support is added.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++=
------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c17b9757b2c86..c4454355f07ea 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -112,7 +112,22 @@ properties:
>        - const: sf_icp_mnoc
>
>    iommus:
> -    maxItems: 8
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +          - description: Legacy slot 0 - do not use
> +          - description: Legacy slot 1 - do not use
> +          - description: Legacy slot 2 - do not use
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
>
>    power-domains:
>      items:
> @@ -361,13 +376,10 @@ examples:
>                                   "sf_icp_mnoc";
>
>              iommus =3D <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
>                       <&apps_smmu 0x860 0x60>,
> -                     <&apps_smmu 0x1800 0x60>,
> -                     <&apps_smmu 0x1860 0x60>,
> -                     <&apps_smmu 0x18e0 0x00>,
> -                     <&apps_smmu 0x1980 0x20>,
> -                     <&apps_smmu 0x1900 0x00>,
> -                     <&apps_smmu 0x19a0 0x20>;
> +                     <&apps_smmu 0x18a0 0x0>;
>
>              power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
>                              <&camcc CAM_CC_IFE_1_GDSC>,
>
> --
> 2.54.0
>
