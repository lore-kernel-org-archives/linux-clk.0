Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE13ED3B2
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561217; cv=none; b=F3+0klRrp4UwPP7GWQAs4jiBbvXG5MDRHhBXX3quFmThwZU3t7gwL4K4VHOvtk1sb8jfUrNA0GWidIg57n2AHus08CJiQhqMJnbduOVlDtI5POsncrdxcqehHJQTFsSO4YKTXihqOzhi1sXadrASgFC8IevzGG4OryiaejnT5sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561217; c=relaxed/simple;
	bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1tg8sVszk4KXKwCBqXKbN0MRhnOXGRRw41hcholvgJtB14ST56iTr3/6UOshDdXPTkKHD9kJA/MhsIKlEAFwUWTFWUV+lxzgpKnzs4obqmONcfkmqrM4cPar5NItpun1a+eOlK0aj01GkQiBKSsSzNgPJQyEVcDar30WM6tGDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPKL53zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvThDcyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPKL53zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvThDcyu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RAaM3066878
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=; b=dPKL53zEuu5ZF8CQ
	5CCiIp3559gmOEziRf4UOGRZbtRpvIpoeIruOPCIMXg/heU4g89dncrAvOwJNu5E
	cB4ShB110c/23eAtBa81qTjxoL74p228Evhx7jsaFjIqQUuWzon+WZZvrKRrPaWT
	IkwmT2m8eSpXGpCh+DFA7mC/CP857vd2RozHJtOJbrg5ggM5HYaBnUOj8pzSwpeL
	VoWCeaSS4IJjnV0pqCcB1PIZmfByLLIXellQWslJXu0FPz4+jibEmfVtGNDIH7Yt
	WSc/mwvGqhgfRG/7vtJNM7Nf5yJANtGF3FiZhRSTeLHznmAUAytchz9mACH3ZVqK
	9zc6qQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphrb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:46:51 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c7429029bso25595241.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561210; x=1788166010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
        b=gvThDcyuZYewjKTFP0cM5qu0rEoz+pfAuBUuUJi3XhPGSOg0FNNn1VSPGZWzQD4sW9
         b5GDE0mImEPzeXi4gUXXrpw9QYN1LlSFcMP7JS3UfmxnjDhFOc40WZx0HdHrhUmzfbBA
         HxVQbhaU5UXENjzfatthC7trAG5QOJLOzfXIy4KLOF7STAq82/t/RAUbT5oAZdfnXJGY
         scA5Pr+L6vCjC0xwQZfXbB03EBh95GCjJMfLIHx4RmRAJrjdKkyOXuc9MJnBjZqngWgB
         WGrUCgP0h+janz2Wv/yp3V700E+pIWnDagE/mOUiKFtV83dUgiAnFxr260YiMiwRI2GW
         M/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561210; x=1788166010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
        b=iGlIC4yLkPzg4XOk9j/HSfjo1q3YipPxy10gOQ9TP7fZRi46EfcwMiLew8xsJH5F2f
         Gt7e7jewVoWV4HfPgS7YqCwRf/TbnM8FomannPxQedm/wXGR2yq7avpDCMPxm0ISRtpe
         5sqeCkelSuBN/RLW7a7bydzXKlbevRH8OBp0lPeeDy0MIxMQiSaZz5jm4khMZq5Fm/f9
         /jHhIzA+IbB/4TTr4QAoI8kpRa7CkF8ufYyyGi7QQRRWDorfbaUBFFpK98McKlhljOEB
         FETrvLc8ZJKNpNUVINNqhb8I0g2qvja8Dl55I9nfusJFV+ai5Gj99tFRIy0X1qYYEiNL
         CbEw==
X-Forwarded-Encrypted: i=1; AHgh+RpeeEAx0mf1Q2q7D5uhcFMVdWSXE/Oj/7zVZIPe1V/amnDkwhlFhVgQjAyKTZmSbQ7GfMoAkDlvxyo=@vger.kernel.org
X-Gm-Message-State: AFuF++m/RnlLLfuOIQjEtt9/AlKnYh9hb2jEqUs1tRxR3hZ0HkzuffOp
	u0uByCI+HW/D3kSla655Z/VJegxRTXuqWZlpbdL1ZrfVranz3PGOHZuy3uFUyHp1ZoyDOrrjYT4
	uPDsNUgkCBC7Zaz4Y0zT0Uk63uF5QVfvtrsHx8SI9AbDtIBzNqYEUCvqZ7dGJJus=
X-Gm-Gg: AR+sD10D1AOTQZU2licAuIyyvktJzkuCKSnh8/e1jvsWtjJ4Mj9xstFkK/Sqpe6BIL6
	DBqCxfxh09filt96NnMvVA33McywAypevWS2Ng2Sg66V+GDHn3wj6uv0yOhW4QtvoBc1M71FoF7
	UV8wAuX13QJnl0zoqF4QEKy3sUmQYoYG+G9toch+v1iY12cVpbM+99HZFlxSTEjl9ZoAB24xkQQ
	oyhEJD9eKkWzk9E2Djb+Mfk23EVgn9i7mQkSe0dJVcBUwxRwbzUoyZSq525+soLtNULoGw8pAbJ
	4xFEbnm97CjkQ03mQh67Goa7scND5sus33kco9ACTO3Ft7IvBCz9hAQ9SIZM7ARhNnW2FNWXUg8
	2ykIwgdcvy4lxqUf+vQNs0lJy
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3580138137.0.1787561210043;
        Mon, 24 Aug 2026 01:46:50 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3580128137.0.1787561209638;
        Mon, 24 Aug 2026 01:46:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm8665454a12.29.2026.08.24.01.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:46:48 -0700 (PDT)
Message-ID: <578542bf-36a3-4cc6-91e5-fc5881c60432@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:46:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains
 for SM7250
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-9-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821154030.2514-9-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfXwuMw9JxWgJc2
 3/QDigeGhHYhqbmJBEYee10OeNN3gxNEJhmfxRxtSD6tt+Mn6WBtfpQhcByQ71ZEpNzmHYPzWr5
 TNPMu1OYovLucDUPgcQVwvfKMN6zW1T93JtBxwcunWi3SkMfL0/yLC1tnAs93y+3LEHrniA1kj+
 aU5WcczTlAP46K1HPFC+aW3/w7Kd1o84c/rCG1gLG8QLZKYfTeUxBE3G3AexzIWndvORxjnfXlg
 3f/BA7AjiktnYDBojl1zAM1zNojd1wY8voLkjLAaE6eHnjLHRoNCHiMspWlv5N/N+MyRIQS61Kg
 A6UmGPgCybn4JifbskIhJjKZu4asX0VY8GfdAaReEPIG1PYvNPmBQ4ytN+1u1Wh/UNGOOeThlY3
 6Mqyma9Id8TEYbmukpGEmbhRyQV5w6EChbkh+V7shgkM2FkuR04yPZ+N2EKuZom9T7pXhUlctNl
 Z4pLZV1ESrAH+6i116Q==
X-Proofpoint-GUID: tdtu-7PhOc0qOCmxTXZYnkQy5-CUMfwk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX62jRojWdMPLa
 Uo+mj7EG9m1Sn288aer5TVHG4fABPUHAo33bOllh8k3ONcC7elhQcREMSxQqJr5dciMo1MJzw8G
 htDwDJ3f86TyCPQLi2bY/S53Tdm+X0E=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c04fb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=0Fz9-S7UgyL-nH97HSEA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: tdtu-7PhOc0qOCmxTXZYnkQy5-CUMfwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240077

On 8/21/26 5:40 PM, Sreeshankar K wrote:
> Add RMPh power domains for SM7250 SoC.

nit: typo here and in the subject

Konrad
