Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D29393DD3
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646539; cv=pass; b=sqjP/6UFId68c1XHweS7EAYByeZ9AsDmV+uFNWxoIiUECmrNYTLH2Q67TfXysZgF0yP+McoAp1bmQb7k0FoxluLioQVqrTGzD8c0GQZQ9hLT+w5llULQjCQXbg7klfb2T51G8oUINzzLrrJokuFEjeTDt3VhBYv10C1hURfaA7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646539; c=relaxed/simple;
	bh=EKd89lwZSQ/xsDQeDeVnhMqnSWOHBwJ1HhYorIEMpOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUNlbLrHCoUUmmoMj+PA2skFoXkPCJjbgPeztbGx71dnCrfIg9YqzbVqotmhLGZqylvB222jlA0uxcYz/m48nh/Ry0stz+4khshmOWUfm/Z40bGg/c4pMq6HKU6w0PN4xsBrksAE2DAL19+NuUIubvkRi0afYLdXX6S8lBidi/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItGHgQWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TU3Tc/qS; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItGHgQWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TU3Tc/qS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtOss1382240
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 21:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=; b=ItGHgQWdEC/OotkD
	lYqaBWBVfEN8SJ6MUCVvSS00UXSOu8XmYOg8IzeyNCPpnVxvxKUfSdWenTNIIHhD
	CU2cfZomO7EliK42WXN3RT0NihJFx8578fC7UCIgMtxkVC4BE4VunAF8JSNQRisA
	FcJh33p/JrXf+Xg5QMkw7RzM8hkNwCVXe9ie6iOg40Rf5fwRFThQEoQsIRlwdhIF
	tgkxGhLQ/bljJX4XFidEr9Yz3W5okEiEkk1ia0q0YrJ4jc0ISWFxjdGnLKBEcyTX
	ZnOa6hBta0b9evaUx5ox1NapVJaZFYyEEHD+/htXFvQ51Zze93h9Wtk5EOb163jj
	A3K4xg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6111g3xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 21:22:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899edf0171bso69187306d6.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 14:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774646537; cv=none;
        d=google.com; s=arc-20240605;
        b=BLz2p3K7YQ92NKaee5GLXuR2Lm/ly/5GA8a2v7LgRfC+GX3Gjd7RVTpwQmHWG6HJg/
         K2VGQOFGK25oUY1dzd5K3oD4eJUycnJga86EaL8cJSVlxTDJLRoPtEuaDSAVkxvguw8I
         oqrHsGnPo2B/t7HzToPsh9XwM4eQx+h+6wYMef4qB5tMlRmC6CYukin0K+81JWS9J5p/
         xZ1sXNXrC67sgIFhvun8N1OB8QtfJE8zMc6CyxTB5FAMh6vTIBNjdQa8PPZ6n0gM6WgY
         J9Rl6uS50R4gfj7Dk6tz1mHB5MSBu+aWcqxzXf6FKzy8NJUgPJoCZwxWtx+ZlxZC20GK
         TnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        fh=kCViTuD1xEq6ehixOj2yoP4/2t0uVg3Hed0uzIsT5ww=;
        b=kQvqbCW+1N1vN41BM+YxPreiYwmXu8nF/a9sNQfwuu2j99iOuEFxZttb1noFL4Q6BQ
         6Ea3r+Qlz0anu4y3M+tVP9Sv09LNkooEk3ZgS3PnciFMlOEVAdbZD+b82y4amhHE2lxN
         R6JJ0k/xu4qZxlUkwu8OXw+goXhDA1u0uYHubtlm7h/ckf3e2S673QfpREiwO39RFdnY
         +HuVWhLO+xgvhGzvdGgl3EPrCPkdwUvpOiabn0hBx7Bo4iaW8Zl0MksiQ6TsyU1xk2Em
         peW1AdfawvTs+NeDT8AHPq51HBAaN22WdOn6hsulFJrsNaUrkgVq7HPI/YVK+1Wqg1wt
         YWYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774646537; x=1775251337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        b=TU3Tc/qStrZnr1l5foed5hTU8hBwnFi3YjlkMbLLg91r3MR/axM5A52yVikollEqWM
         3AzK4vs8mZfQPnI+S0kEiWkFfLG8IhRWkxz70jnNL70Pf7rub/lfTupEu6EAdPLjqEPR
         t9VE8z8UEySLYcgzCuOX4cFdDCkVMBqVUdv7qJAu6XhNCbccBQ/Yyq8P3J84yo9XSUcM
         8ISWxnGalREu/klByImrhKVHEoczkrlmPMlbItzEtaXKhEZt2gCiSUr6LIo2psj3Ruz7
         x7LMDxykO7DSKjo3CxPZE/oNjs3R1iiO4f25sb/7nC6XDrrU/fYxjTOxRu8E3cNkGcMy
         9jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774646537; x=1775251337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        b=SgFH7EuA2f1aBsEcYh69DfAClmvNg7AGha9kxPH+Sd0Z0xfdfQki8K+f+3VhwxFoWK
         iGvX7L+AmV+NUHwisXHZKUcRPvnleUR5dvL4bP9fyru3uJkO48sqNlMpKvQt8fE0VoJM
         z/TSHa7VzGfssRhdza1x7ZDAXLIH2RrxMwK/ZHMzoanAQ7iK2xrbxF35ffoe2BbN5F1A
         zsZ3tWKYzG0KfUeus+fZVuHWDM0YhndqB/ZJEYaIOsNiRJ+41SkjKW2wdNBooQ9iqheo
         hS3Kv5AWNsgtrOTb3lpQ7Fsf8lO5Tq+gcKxxATJsLgoAPrinkuWgfuiGSPYwItW43oyl
         P3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUrHGDjzuGoQi2boSmGumg/xtQ79eRgoHOeo3kNoa85KCM6PnDrtAvNWRxzzIUi8i0z0DPpq/SMPFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNy/S4s76C/jLc8C3OJpz8wfjqRY0Y7WG5DNOeHBnefmSQJmf7
	4wPX7Lh+2bAqgGl6O0eft+7TitcESD3U5Hv1SLtahO+CbDb4KK0LNeha+a0NjqZUhcmM0upa+go
	lWwnJhbgF/2K6e4DQdUwvLOMc0C4JetO/vkfmlS+60xCgCvdmn8sNCRU29D14QtpGB7CXfHZvnN
	VREvIOJReuXgjo3/kUb97BZVhmY2x3TvSYLF00gA==
X-Gm-Gg: ATEYQzyVThwrU5I4BYwvRa4VP96mQ0Fg+lNtAFZ2C4eCXIqrsW6zlHvwncLKSGfOKVq
	NvSkx6I6IJXM88XJ+rbkri9NiR+aCJU//1rY68DBTP2832mHoaWlNjWe00bco28cr0i5ejA9DPc
	OkAQYb3M8CiobayU5q1o0XkzJMbvXzW6rHCu2mh8MVkOL49skgwQ3qD4CY4Fm8htEAo1JYx23RN
	S5mxmxMF+IPn2NMtpjngK7cmKYV1YXJZrnsaRqW/YJZ5mNiguJ4prVXjjWdM7jfrVKk
X-Received: by 2002:a05:6214:4602:b0:899:f820:641a with SMTP id 6a1803df08f44-89ce8ea0959mr54540436d6.30.1774646536613;
        Fri, 27 Mar 2026 14:22:16 -0700 (PDT)
X-Received: by 2002:a05:6214:4602:b0:899:f820:641a with SMTP id
 6a1803df08f44-89ce8ea0959mr54540086d6.30.1774646536246; Fri, 27 Mar 2026
 14:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:22:04 +0100
X-Gm-Features: AQROBzCYYOuC9NiCmUVBMRzmwgB3BcHsu5HnhoneZ8m-194fkybLeOjKTsh6p1g
Message-ID: <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate sub-devices
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MCBTYWx0ZWRfXykg5CFow7MhI
 Gecz8059rDOZJIL8fQ4DkmnW9dmGBToZAjERb42VXu5bDJzg6a73aPy6FlVpd8RWbaPk1LBH5mD
 X8Zc6ThGlybRIRpsQswdcPV0fwUAZnQUpQ00kDf5DmiyrLq3jahE9XL8r0BxOyN35leExjPTmrk
 f4gLat/gvRWZXsww3AYaN6SZq/isb568JFQyf+8T2X0Lh3q9/SCJEbrQv44ChH2MJ7CI/EVvpGe
 vhRzlShdZ4+So8VjGl6ZxuBpmyWo5IWrCKm3MzqZl9LHEGLZ4Wsx3Dcfp+w3dT3U8tD/M/aQeFY
 5swvhGFfkXS3BxKBfMUzYzZNZeTqozjA+nrbC1yNkm2oVEmq1W4EeLeqewkXp9equGTzU91ZmIe
 y1oR4J2I0ODoNwsWQzUcvMEXR08kfTWUehjsjVB3TVzOksDGZ9sHCnatvF/wn+fF3EXV6cISwvL
 9l3SrWqWxl1A2nXDayg==
X-Proofpoint-ORIG-GUID: MZTaMoUkvLNu2RWXhCXsVo78Das4a-IM
X-Authority-Analysis: v=2.4 cv=aoW/yCZV c=1 sm=1 tr=0 ts=69c6f509 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ALasc2Z-pMJxbpW9BwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MZTaMoUkvLNu2RWXhCXsVo78Das4a-IM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270150

On Thu, Mar 26, 2026 at 2:28=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Use devm_of_platform_populate() to populate subs in the tree.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Other drivers typically call the populate function at the end of the
probe function. In this case, however, it is invoked before the main
resources are enabled. I assume this is because the CSIPHY device
needs to be available early. Aside from that, it looks good to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 00b87fd9afbd8..66ea057291f6d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev=
)
>         if (!camss)
>                 return -ENOMEM;
>
> +       devm_of_platform_populate(dev);
> +
>         camss->res =3D of_device_get_match_data(dev);
>
>         atomic_set(&camss->ref_count, 0);
>
> --
> 2.52.0
>
>
