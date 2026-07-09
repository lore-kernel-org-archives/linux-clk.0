Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02D2D73B5
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614839; cv=pass; b=XABbUAjcl4cVYk1w3VwOAKytsPBKI8zvPNlN3rlTXPVnM1/vzZPOM7XRJghWJUmQaneFvudzBhApcTmXGeI2aYhjET2KuuPgx13ntkxCln6mCklVw7PaQbG6RditYoCXy2RA8uzvru0PbW5m/Z/Skd0RzRyivpdlqmw6v7P/YZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614839; c=relaxed/simple;
	bh=xeFfrz6h8yMo4SlaHzqhiMDslcgOYLX/u46LE+HL1N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3qYO2OhjoJNI90GFhPwC8XOMjQJ4jbL5wBo9HjUQ8Qve+oZ3sqUdwDuCao1X4e93cqVrhq7P4wkbfAiozeZvStTi80AjXvm6vnz+OfTxw4vtkTR/IOaMI5z7rVte/dSxGvR6Vg8Tm7R+Wp1gkBo8CGJWp54MdZw4zfuCW39Gtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJK+cjCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpt0Ge61; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJK+cjCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpt0Ge61"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw6pQ2013010
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 16:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=; b=gJK+cjCBtngOV7iC
	igPGm0DUQGrCJ4j6Nf3o2zSH+gzpMxI2RKaRYq2YIFHKLcoslxd26PqvM049n4rD
	w4QcL9+BsLOFQt2iXsHoiyqhZLl+JrY+L+CszR+J8Ijs69uPXjd1FCfV1PmLnkvb
	+DTac5yISgY+QT0jLVZPpRJTfJM9zH2DvrgCQSZD4Li3h1HB0DfU7KOOLyqzA6Mj
	03iGCkAbIeJqHP1VD40uzx7rQ9aP+PgEyQWaoVAx7DvvZvAY8AhSXbDZeV64BgeH
	jA6M72Q/Ac4jzxMz8MlDnxeX35icerG0uAnsT2Y0zGVT/NFko+kGNXnXNy8peEf4
	S0nXRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418kaj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 16:33:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6a2f5995so163551685a.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 09:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783614836; cv=none;
        d=google.com; s=arc-20260327;
        b=VMKLxYXNFV2lISQ1/i/HvZ8KAlcA7r4yKMaLyOx6YbTQKDwwMnrx7MPvQR09b3JZFZ
         O2yRINodM5ST3pHRyB5sHFYATmtqNpSRyXHRt/L9V8MpP8ja8Sv+L/oOcG4h16VtrYZE
         XJnEQAYwyiZgWH6gJIxMfeTseaybzl+l/09cpO3aJ7jwwvqz2b6jkxjayUjLqDRj+4qf
         MwGSh94WtDC3+H6910T9YHZEqw+I/etXY91tfIGG+8qqL0M5marYCtbFJo+wpAJzLxn0
         4VeNOLVyhbFVnNS+NuN2jkiVsIGzpmSw5gT7IovA6DRabBee5/9jsUfxpFlpmEN2LN7B
         oh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        fh=Xb/fdTT8ThxFcyWGMdCm2Eu2aXPYRcBYSDXa8kW2rY8=;
        b=M+iB0B6n08OG02tGi1ksvOO60g+2Xt5X+AMKh7SZ1OgdwrAyj0K8SoKEldsXqaOlp0
         7TMFPYUW9dSjdXIAn/H1sGFnX5BL9thdYOKW8twHOlG5Pq54xNp45x2v//GGKDvfRDxB
         7tvy8PzEFoAaCQ0N1iilFYSSRF0O1YPvdYD2xkKfYluPWAa73zMpedduYxbHr62lLhX9
         k7aFohmJOLbvZFl/s3FIrYnl4YoQcro2PBMHP2dAPRzhsXadloqUVga3kexVxWdG8Bt7
         nf5sdjN0+2BauR5yJzvIHBq9xDVF1V+tf5iUaTW3tNcxPJboA8m/gFI1Y5+fIyI5/ohW
         ycxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783614836; x=1784219636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        b=fpt0Ge61k5eCyN9EOd3N/vQYe1fzWqSuCP/YYZPD/aFxIGX2YRsVyaAUtnzEi8MYgu
         2FjfEotctKoJ9D4aeitc+mUcMEOchaYZNOYMn9JDxUgfpYkwGZHwIU+5mOlqdXaIaEP8
         1L3AcgYdI2Gjfbv36p8hT5FrGdUzHj/E3yoV618uY1seH4pCotPsGrhAVI9OP70M7G68
         CyAbz/m5UOLEPCL0cLym2skivYF3sV/Fr0K3vOCoZaxGNrzF5XrlA+nuHOhy/ErQmAsS
         GtGAHWvnGXFqdu0po/7VzbVtipFMY5yLGrqObJbWaUqlcdnXFam9QFAIgpxGaMqriq0S
         rVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614836; x=1784219636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        b=g65RkUf2Dj+06ZUHh5/oJPENW+xncaHCEY69Lz5BjAQFyiXBiZdubgl7wprb2rGLGJ
         wCBjuhiQMX2WfIPVawuUNotEfyABn0NLmtGN+KiSksgT5CZlJmnCX4FUhXFXB2/ksTWw
         6LECejr1zOXJvBDwKfWZ3Hntqw3e2Jm3nbqYT3473jdF1nUmoK1WJi7/5/Ls44e119mI
         Wq5tMzaVVmxPrQNiP5qpW4Mnj24Rh2U4Fd1WgdNWQifN+CRCh7qd+HpqRGR+R3zZ3Svh
         vI1lKSZfDNIIohY5x5Y75rtpq2+yvkrWML6wuzMSiEXco+xkv+NAft7G64Ab/MGO8VOu
         YKMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCnjJfkd9Laz9U13f38DakdzAnb6Iao1fn47bTxVXCc6Hmr9FdDMiTq3Jccgs9dBy2IYZ39QXYZs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhHYx5YcH1ljoHCbiwuZaEkOMcgkqIlCstHevk5CVa/Q9fJOq
	79/eUXlc8nEjTpp50Dncx1gES4eFVOc+5AZESzCvPUEdJRZ+c0xobyounKinRNjDLBVLQRVou7X
	XcR+I48AUftebv8zZQtPwQEqMxqpgeUFcCj59QSHgp0RCM8U4+/8Qm4GbT2bQBoVMV5iapXu7iq
	6E6chS+ptZsjig3lZhbQvx1XFPTgx/Yb07G8wDyw==
X-Gm-Gg: AfdE7clR/Zer4b59uYhfUyBPNmduuGOdkHNrz/pbpJ2aC8SHB7oZdKoUQNb33SEdlIv
	m/6yN0OOfppJSLEtW/58LggX3xPBvEbC6EKqxMkjqWUhsyRHe2tFc+bnVci3c8FJ/DbbN9YOEIf
	wpvnpGUYvs6Hu1JqDjXl8lbmYfcBWuT/R5Nhi1pq/pWgPWKBsZWwhNuShP6lyIY5ZfWboMDF8u7
	+DN3Hmxqn002HYnTOoJe3GufMI1hIQDco+qlr1XjFAjzAVPpKtaqPYcWx5YVKH3UuvbRjEfTQXw
	JxY7M22GvA==
X-Received: by 2002:a05:620a:6cc5:b0:92e:c117:9ea2 with SMTP id af79cd13be357-92ecf8edac8mr795067785a.80.1783614836230;
        Thu, 09 Jul 2026 09:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:92e:c117:9ea2 with SMTP id
 af79cd13be357-92ecf8edac8mr795063985a.80.1783614835839; Thu, 09 Jul 2026
 09:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 18:33:44 +0200
X-Gm-Features: AUfX_mxrvMsfVaIuwsAqRlu-SiIqeRWjw3dsC18UJ-fCRtJqc3yI7XzxXZWCYk4
Message-ID: <CAFEp6-00rJSrOCyHnCQ-VkSWLYHA6C-MCGNt2oMwAA6ngi=Dxw@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
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
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4fcd75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LRu0fTMIKIkxnFiMMFwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE2MiBTYWx0ZWRfX5YpR06ttUIab
 b5BFITr/rM1pj43mGTfu7z8dPHIaCN0/MawZnwVzOnbqUz3J9XjZGeNe34flT6MrpwPZ2qrr0g8
 SCicEKOHGPdCxrUHnNWn1QgkVhnuNSrBYQld4m+x1vPTqCLXeDnigeExELze/8GSbjE5iNRO5n4
 cyJazANhzYCX9F64qMsLhqVGYrbs8FeSfhWVYvfxrjorQsIcr2vHbyqA+nqbO4Jxa1mO3gwbWQ4
 TjTNO5P6Myp0pY1Z6AEE/HAQ9lmfbxEelJNr3gNT4K8/D/DDPzvhtWcJFrzri78PxzwdFfsdsUr
 86qH9oAYijQFGjfwktd/sitSELmqZ5G6KCKqgEVmRMBXL3XT5QzENLF5B6BNsQA9ISZYUFxbC1I
 jbjwRwdtjXLZsO4LSvmxGRr1kG4qem0kxhoYiPz/+du5Ke/zf0XNIx07//xmgzmkkLwhS+IMoUM
 NjbX5zAwX6LQXpzN6jA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE2MiBTYWx0ZWRfX3r9id6wCMN70
 qDCAd/bsmqmS8A5HQF9BeZ+SKtJ7yfoxumr5esxXuFAnC0f6P5SofkCQ39QnE42A2B4++B017Ed
 M48hLyiMYSetU5DV8JqPUbWuzUrm1ts=
X-Proofpoint-GUID: Bo2YrRcE4VwmgE1YccxXOqIqfIV3RdXZ
X-Proofpoint-ORIG-GUID: Bo2YrRcE4VwmgE1YccxXOqIqfIV3RdXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090162

On Wed, Jul 8, 2026 at 2:07=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 95e655a8b6aa0..e814a96953b1b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5512,6 +5512,7 @@ static void camss_remove(struct platform_device *pd=
ev)
>
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x16,
>         .csid_res =3D csid_res_8x16,
>         .ispif_res =3D &ispif_res_8x16,
> @@ -5523,6 +5524,7 @@ static const struct camss_resources msm8916_resourc=
es =3D {
>
>  static const struct camss_resources msm8939_resources =3D {
>         .version =3D CAMSS_8x39,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x39,
>         .csid_res =3D csid_res_8x39,
>         .ispif_res =3D &ispif_res_8x39,
> @@ -5534,6 +5536,7 @@ static const struct camss_resources msm8939_resourc=
es =3D {
>
>  static const struct camss_resources msm8953_resources =3D {
>         .version =3D CAMSS_8x53,
> +       .legacy_phy =3D true,
>         .icc_res =3D icc_res_8x53,
>         .icc_path_num =3D ARRAY_SIZE(icc_res_8x53),
>         .csiphy_res =3D csiphy_res_8x96,
> @@ -5547,6 +5550,7 @@ static const struct camss_resources msm8953_resourc=
es =3D {
>
>  static const struct camss_resources msm8996_resources =3D {
>         .version =3D CAMSS_8x96,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x96,
>         .csid_res =3D csid_res_8x96,
>         .ispif_res =3D &ispif_res_8x96,
> @@ -5558,6 +5562,7 @@ static const struct camss_resources msm8996_resourc=
es =3D {
>
>  static const struct camss_resources qcm2290_resources =3D {
>         .version =3D CAMSS_2290,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_2290,
>         .csid_res =3D csid_res_2290,
>         .vfe_res =3D vfe_res_2290,
> @@ -5571,6 +5576,7 @@ static const struct camss_resources qcm2290_resourc=
es =3D {
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8300,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
> @@ -5587,6 +5593,7 @@ static const struct camss_resources qcs8300_resourc=
es =3D {
>  static const struct camss_resources sa8775p_resources =3D {
>         .version =3D CAMSS_8775P,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8775p,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
> @@ -5602,6 +5609,7 @@ static const struct camss_resources sa8775p_resourc=
es =3D {
>
>  static const struct camss_resources sdm660_resources =3D {
>         .version =3D CAMSS_660,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_660,
>         .csid_res =3D csid_res_660,
>         .ispif_res =3D &ispif_res_660,
> @@ -5613,6 +5621,7 @@ static const struct camss_resources sdm660_resource=
s =3D {
>
>  static const struct camss_resources sdm670_resources =3D {
>         .version =3D CAMSS_845,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_670,
>         .csid_res =3D csid_res_670,
>         .vfe_res =3D vfe_res_670,
> @@ -5624,6 +5633,7 @@ static const struct camss_resources sdm670_resource=
s =3D {
>  static const struct camss_resources sdm845_resources =3D {
>         .version =3D CAMSS_845,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_845,
>         .csid_res =3D csid_res_845,
>         .vfe_res =3D vfe_res_845,
> @@ -5635,6 +5645,7 @@ static const struct camss_resources sdm845_resource=
s =3D {
>  static const struct camss_resources sm6150_resources =3D {
>         .version =3D CAMSS_6150,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sm6150,
>         .csid_res =3D csid_res_sm6150,
>         .vfe_res =3D vfe_res_sm6150,
> @@ -5661,6 +5672,7 @@ static const struct camss_resources sm6350_resource=
s =3D {
>  static const struct camss_resources sm8250_resources =3D {
>         .version =3D CAMSS_8250,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8250,
>         .csid_res =3D csid_res_8250,
>         .vfe_res =3D vfe_res_8250,
> @@ -5674,6 +5686,7 @@ static const struct camss_resources sm8250_resource=
s =3D {
>  static const struct camss_resources sc8280xp_resources =3D {
>         .version =3D CAMSS_8280XP,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sc8280xp,
>         .csid_res =3D csid_res_sc8280xp,
>         .ispif_res =3D NULL,
> @@ -5688,6 +5701,7 @@ static const struct camss_resources sc8280xp_resour=
ces =3D {
>  static const struct camss_resources sc7280_resources =3D {
>         .version =3D CAMSS_7280,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_7280,
>         .csid_res =3D csid_res_7280,
>         .vfe_res =3D vfe_res_7280,
> @@ -5701,6 +5715,7 @@ static const struct camss_resources sc7280_resource=
s =3D {
>  static const struct camss_resources sm8550_resources =3D {
>         .version =3D CAMSS_8550,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8550,
>         .csid_res =3D csid_res_8550,
>         .vfe_res =3D vfe_res_8550,
> @@ -5715,6 +5730,7 @@ static const struct camss_resources sm8550_resource=
s =3D {
>  static const struct camss_resources sm8650_resources =3D {
>         .version =3D CAMSS_8650,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sm8650,
>         .csid_res =3D csid_res_sm8650,
>         .csid_wrapper_res =3D &csid_wrapper_res_sm8550,
> @@ -5729,6 +5745,7 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>         .version =3D CAMSS_X1E80100,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_x1e80100,
>         .tpg_res =3D tpg_res_x1e80100,
>         .csid_res =3D csid_res_x1e80100,
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b..698694d3064ea 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -107,6 +107,7 @@ enum icc_count {
>  struct camss_resources {
>         enum camss_version version;
>         const char *pd_name;
> +       const bool legacy_phy;
>         const struct camss_subdev_resources *csiphy_res;
>         const struct camss_subdev_resources *tpg_res;
>         const struct camss_subdev_resources *csid_res;
>
> --
> 2.54.0
>
