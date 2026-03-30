Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301473AB27C
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860946; cv=pass; b=lmVf5TppHTGA5Zk7rkQQmt5YT0vR9AafsvD2wRmxZ4WOn0qGt1fbb+sdwdviNNS5aSYPejEhFd6HVTpiymzYfOeLq9HLpgA5HGnPbm9qNfRY2vawCPNV7GeIxYa8so8wGjDm+NCXenwXNPq/62AIf822aoePYTqziA8buPR6LgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860946; c=relaxed/simple;
	bh=SRrNYohKxnZSbgLZfgaJEvQX/4xzIBNkhGypkqbdSYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aG0e6CuUpdJpfJda9QVuOnPsLbkEP0PFtVTIpXHnVZ0Dp2qc1UtCPEhrE/TWLlAnRW6z/lm9weMGadrMHc0sZ7mcgn0iPy+FY5z0hYLuvQOh5x+mE6WTnbp/yWaEADF7oYBsm7HeVaYK0tGhUuBq2UEjop231guu9KCTPePi4yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4CCJWdp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNcBlIfI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4CCJWdp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNcBlIfI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4BFb5581063
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 08:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=; b=A4CCJWdpZcJy7BHy
	s8rPnbA2OP8suuW5zKkGi5UNNCIz9NPJono6Yo+NFMcE7P6cKFEL3YQ1NRxr1tfh
	aI7q4zEstPqrd3EOiSkS6sQBOQ0tA5zV9yQenSNRn2eV1I9Dy5OZ0teB8E6tBkih
	29VP4t2Vu8NvSrzBrV4YUItdpF+BfX9v71zmgqKq5eDdVmOYHQIFP/O9bIG6FRUr
	g71dXbtPMaxsPSLFooKadWSoq5/ELH4pDKzn69n+DUxle/6xZp8gzfFssNI3cLCa
	PxBdsStk4UKWY2onpoz3VpY519+EF1d/Q2sEFMe0ke6cqGwc1qyiRr7tt99M98hF
	9RbfoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqnfs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 08:55:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b781542c1so101400371cf.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 01:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860943; cv=none;
        d=google.com; s=arc-20240605;
        b=D3nME5BhTNVZb5OMszNZu2S8IgHBFFfnqkB1/JBgZRg1SlxJ7UIdo4G1zXSTXqxEXH
         AHACSjROGa5+5oAVIpBdQJ/y4SEBZ5o8gclaKxWJFvize4d1WT652N/4Jm4iGHbOASbh
         JwQ1SlkAiLGEO4RgSsQGWeYQS8fGIvAkOQIhAjXXiogUnBpbOl6XQbZwGBdKCbvYv8QO
         /6xBhICp7TjmKiVMd+Ema7O/qxyb7wLHupFfPbmGz4HMpUnol15wNtMe7dXgYfaIpvuu
         NZu1uTzPtDzOf9AZFYT4z4IlEqR1svF6my146DsZ4x9p1lia+3tVHPTgfvd2VTaxN4Y1
         G0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        fh=0G/MhRsciKKphb++XlmTkUubzx1NSakzTrHuGYgAkMI=;
        b=bHZL6/Se+30KO43feVubbBpYRoALkCLDNMEILkiCGd1AyNJLP+sRo1oPD7dREIDduM
         SNjwyKJrnAyYbbeTG6OJu/UNuRJKxqBd9t24/w07ZJEjQiDaYzmTn/wWZrM5I4suiLoR
         6kcUb9Ok5ngey8DxNYup4u8aC3tUxW37D7ewM3yobKFRvGT4J64LBBLuYTdLwT2AU8cy
         hOP85Re8er99upPp4I68hfee1C+ylbDPphkoc6JoOUHCPLi3n+S7jYPsnAn9a0An1JIH
         BQYho4DbA+opzJsaEzhPLawzA1YQOhRTSHdUIHHZ4vrP7r/q8+Ijok2SDW/5wk0+hkv3
         4Tzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860943; x=1775465743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        b=TNcBlIfIi/L4MQNGd8PeCf0aVsWT0V/0e+aAh0l2eCuGRpFOo5ch3GJQwvMObtglmM
         njkMGFre0k92Bi85MPZs0891LHJqT66XiMN1S7qUtm5yEz/jSTWHKcXbaDQ+7nBkOHtJ
         6PTdJJ7BxoPygySqfL8tNBKlPUslv1aTPbNDkegxKwWYqw6PvyxAzTGnWkMEv3RAV+Mz
         +gtyWOJw4TNFfs2GF2Fa6x01sS1nPlOTfvg84W9yucFZfoNJX7hi4/Nyk114zX7w41MU
         v5kG683pQGkDfMjlpEGLkVpTTmAG5TirpOowEzrvadko89yGqp+Fzk/1XWckr/3vghip
         fMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860943; x=1775465743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        b=QxawSI6vkfAPD7Vazo6Gbr3IxtdcB9pHLILN0QmMQzAHZgeKJxsvGzzsYWfPsTmO3J
         pHPIcJIjMKw54LIOtjV1deOB6n8iGHY3VlVc/CpfESlU7EhbyFWuJByiDDlL7x+tkQoH
         sfkaxbjGu4Ex9U2bXsK0+R6rMeYkn+0WDQpLOiy3CsQAC/pBnojXDv77GtjUBB4ZROGk
         3yKer4J/voRpUQIOvZ2xJwHhOK9YNaRMzwaV+ZRfIdMw8bpKW3evwgQuZ2bB505gdln1
         Vc3BlOoYi8amWp02xGoAjqsrHDwdipsE1IJBz034oDGVUW4GI2/YiWKhcCT+hrwR8PRx
         P6Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUZUDJdpqPm/OU2nWUc9GknBX4iBNeX04IAkOwiRlRSbeM4O1bU01zlHljrRs2v5i9X7uIpW3ENQuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLCEAcqfIMPqltaP1dnApYKLtCR3h+2DbbCQFxtjC4rv0pV8O3
	zRme3+FCD6I8/KO8+HQu5bBOaH9sMRrPD9GwpR6sZ2ZEWYlgTZs+RUu06Gx8Ww8mmiqODhgqtie
	dnoBUjbFPSMe7uSm7KbsTIdcJE9nucuRmSjncCA5lpdc4/ZkvvfU0Xhp5lReO4ie/vWA14HC/nb
	SHloiyG3EUgp3g+nSdoHi0MMs7K12g7OLrZ7UYEQ==
X-Gm-Gg: ATEYQzxjLZ0s0X2OPP3XahcFt1K1QhkdOvoUInho2QnR8OuPFUcqUktb1WxivWMHc2F
	WRJzVoxtA/teZDFyPwSoggwziu7lb6/1ZcJ19Zi2P3nH1hQbDSvxCrPnZwCzYC1iqCH11thHYN7
	sCX6v5Mum2MguOm/nU7hctbXe/tyCjV70PLHm68qrx0mbZ4izHiDb1FfqLXNhGBAonTqSXQe3W0
	+YrS2WaIa6FCmRZaLRLCy2mD+63bvA5Z2DG8Tw=
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id d75a77b69052e-50ba37f5c80mr177297951cf.16.1774860943434;
        Mon, 30 Mar 2026 01:55:43 -0700 (PDT)
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id
 d75a77b69052e-50ba37f5c80mr177297741cf.16.1774860943044; Mon, 30 Mar 2026
 01:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:55:31 +0200
X-Gm-Features: AQROBzBxMB6veijPqkgVNgzq21VJpm26IzXgh3AXCyALUcCgg6JzL9jZ1w35UvA
Message-ID: <CAFEp6-2iSR_BBuYE6t__yuRr1e4WN8pGnqJSGS6YnKVFw+YPdg@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] media: qcom: camss: Add support for PHY API devices
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
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 7gHSQxiXzYFoRkhq-smfoVMjfnPOj_XF
X-Proofpoint-GUID: 7gHSQxiXzYFoRkhq-smfoVMjfnPOj_XF
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca3a90 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=2ZO8jXjuQ1C68hZI1ogA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2OSBTYWx0ZWRfX6cpZnzxQztwn
 Gu3i/OyTIkuEahrUDWTcOEDxDL8+y901CynRlng9jmJ4sH1xVORK/gOJIbOi86EmlmIaSE7cKuZ
 1H39YcgOF2JVErNLPnA7Xprtnnec6+30KLqB0lC3ICMBatqHaxV9dbaA21AHQ5PBb0gibDA01wS
 T1xo0OpM1aT3xXuD7cp4tMZSV6lz3zmLMzJsv9leTiOc4JBC0JQKUyOrgXIBUHw2KKrUtPS+BkH
 Mu/5DZdJoCJuzRPfvXVrfNuzRSYWarLdY7AlYTATWxTcmVqc2SgjcDJp4KsWYmXtebbG+pUy0Zl
 ++YVAEUPmI6mcHqRxjeP+dCkkE514Cf7m6ABgcRc7LptiR1vYwHAE06Yj+C6RLRNXo6BG1iaPqB
 UamXDsOT+aQCRAXqAyGroIqYfAu5Y8CREHd8dbSc8CsKQR1zTcjdJj2Ig83A2Ocgoy6q0AhiDeq
 +iAkfi/0efq1jHxtL9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300069

Hi Bryan,

On Thu, Mar 26, 2026 at 2:29=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add the ability to use a PHY pointer which interacts with the standard PH=
Y
> API.
>
> In the first instance the code will try to use the new PHY interface. If =
no
> PHYs are present in the DT then the legacy method will be attempted.

This looks good and pragmatic to me. I just wanted to raise another
idea for discussion: would it be feasible to always rely on the PHY
interface, without maintaining a separate legacy path, by creating a
platform_device and attached resources from the legacy PHY
descriptors? This would allow camss driver to handle both cases
uniformly.



>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 189 +++++++++++++++++=
++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
>  drivers/media/platform/qcom/camss/camss.c        |  72 +++++++--
>  4 files changed, 239 insertions(+), 30 deletions(-)
