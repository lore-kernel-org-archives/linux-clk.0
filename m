Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F87225397
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 06:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691237; cv=none; b=dFReCvvRGCrBSDgmhSrWk9iqWad0C0ynG6OE2oxiWzPXn1aZVu8BvC1wsgM8Z8k++YyoPiPSxkmdGA8DaCIBd/iFMAW/ih7KoYqPnZYP77B1skUxL/A99Yi2ppKjlIM++yHi8r+WCL/Td+XOX9NqEtF5YuTqVdsh+Ev7M8FlD/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691237; c=relaxed/simple;
	bh=eyvMjbHsGjnT/xse2pYrDoq280R24SjuX0EZw+F7UUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dy0U6UKi1ZSteBi0LZ9wkO6y/Q4DOxph39EewcxsHDgv8JypjoC+IduzmEKxFznPP2eaquziLn0KJvF8psNeSZVW7yhLA1FmXYXc80GHZqwOHAmxsR6h/5BTM2i8IBTdlnPIWrjhQJfw/6cuuvIhKjkhzWsbOiEVMlLa7AcSXwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpd+fmlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wv8iaVCx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpd+fmlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wv8iaVCx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253A6O9864824
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 06:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wv0u387cuNJreDwIWoHu3RhCC2+/1XNzjBUKD6GXCsE=; b=mpd+fmlME3UVTm4b
	pK+RyCU85x1woQbJSYRZalvbsLrQMLgxLxg6fHKp71ADXVY8CM7q2I8n4Ay+P/vk
	AvgSLd48oZd4u3O1vJz4hHZpSQpnN6tmoAuzvQPsYLuWGILGTJ3N6jfd3ky+9Eoq
	h5Jcqb9BssioKG20INEvmpmEurCbC16fUivqueKh1FQiyHpaGF02/UP9DLvmVav0
	4yu6goECzOHME/bpQcOa0riGCNdzfkO8N5Jpi8nISus6So3H7Je7HynK7EOye5bu
	ZzKTH0O8ucBlJacxbxkbsuhjOXeNzDBENuMcYQh+H1cw5GvWmzwx4WAJJMaYBOUR
	MXslUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk0fr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:13:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae66ee7354so20582645ad.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 22:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691234; x=1773296034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wv0u387cuNJreDwIWoHu3RhCC2+/1XNzjBUKD6GXCsE=;
        b=Wv8iaVCxdyR37FuviUs/JnUB1p0k9QAmebn8WMbr+rrG0e+j44Bl+ynKcJUV3NZvBh
         x+Y3Cae/3QY8qpl8sCxASqhuGKEfJfG5Ti32PeAybNLR/LsN0Y3LEkWtu8H5aqnEwV+/
         uFSR01r4N8EglZRL9OSXmzoG96UXE3hmDaMjswc641LOYsArULF2mJP4/ZNkurzL0av2
         e5Z3vNaw3WcyN+22isRTsKVsDsAs56sugoPKe4CPSDX3H2sbEjViibt53swpstQ6VuTU
         uJd9afB2xq1mJWL+23YiSz/Uc0tuiBkQNpVYc2CzHV6Xns9v7E7LjBwJoLGjNvg6CuI9
         B/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691234; x=1773296034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wv0u387cuNJreDwIWoHu3RhCC2+/1XNzjBUKD6GXCsE=;
        b=TiKjQwpWDT8TL5otTr0fxoj31cmlvK3MNwh2MP73fJ2VTgnUtyi/hNF8TyNrX+U5A5
         0UrRPApShHD7Lw2hTNnDKqjuagU9lPyh16Le1NA8K46fUV4KgIhwiXPeh2GKI/mtw55q
         2sIRMi6pfYyC9ETdgEXLrARwwoeXR9gECMmdiFzH3uaabKYEFnDeR6bDmW+cPc6exhGH
         J3ImYQbuTM03LwPFV8PQ8IoX45ikSsowdTZcVbTNBxtTGwQ5aPByzw0uPMfWZvmqqdZB
         8cRuXGLqdchAix+sGxHLgbJ6qFRn93O3NXaodlROn88aeLn95CwgQFq48kmuWmb9J8EO
         SjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr7vGn8WDmWh4LNwMCO/d5twvfwQSxUxnRBTPqbzgLBULrgnc9U9DBGM0REpmrp0UP/zma6wffcag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYHr2ApYwnOw+BGO//VewFkXEhTKNN5EPJZfZEpp8GqwjXMBTX
	HDBBm7JJzFRDxQTEn1EmszfjjjXOcBMqkczjvMKvkfOrWjALV+dTk039OO2SC6JDYdpke7LPSLi
	7Lwg6sl7AszsbgCZkAH5l+lalvi+jDQhK0Pm2x1rPV0Ix0fZftPFuFtdy2sPlwXI=
X-Gm-Gg: ATEYQzxamtCNnWhNqDlMNB8k0ZliFTPr5CPpO+s2pa8knh4LI+JgaB10XH1LaTp1KL6
	Dz4WY+Mbk64WtWQLXyURrdL9Mo5gKDgEx2GbQk8oLwXErdtxu6njOvnkWNxlQ9TyV2UFK7B6iya
	yyPdYrTGemckzkMH//wTHdtTat0GHPBW3L5/K6k4nwDj6D5peeWdqD8izmq0PDGxPFEST6QfxZ3
	ME7ZgbPAdUU1mL7xyguQmI4Oez0RPjvV1Kax4+8U8TDPxHZHrDcB+qr21kKTRsFHncunkwf0hLn
	Vg1VhOhGSfsAQu1qHYSQU6B+780H1pXt3rxJc8FxPZp9aXDNAT7AjGjjkvGuzwfmOdYfVvZfCZt
	TdnDuUZJ48qUsbCzyw3CIFWjNjZGSIDnIoBU9YDzsyDv415ciWQ==
X-Received: by 2002:a17:902:ea08:b0:2ae:44db:56ed with SMTP id d9443c01a7336-2ae6aa20d76mr46975765ad.15.1772691233580;
        Wed, 04 Mar 2026 22:13:53 -0800 (PST)
X-Received: by 2002:a17:902:ea08:b0:2ae:44db:56ed with SMTP id d9443c01a7336-2ae6aa20d76mr46975515ad.15.1772691233086;
        Wed, 04 Mar 2026 22:13:53 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5e1699c9sm68679885ad.10.2026.03.04.22.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:13:52 -0800 (PST)
Message-ID: <38302cbf-d832-49de-8e8e-06ca3dd1ce6f@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:43:47 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock
 rate setting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-5-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Cu0dV5YkIVe8PyGEGJL7NBkSY7aZsAXX
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a91f22 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0TM1Jmez4aZXe2oQUkEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Cu0dV5YkIVe8PyGEGJL7NBkSY7aZsAXX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NiBTYWx0ZWRfX8RgPxUcNE24k
 9GJ7QXWv2woUmShC9wOya7XP+3JF2vi4WOPuyGQbvTQgCWVCeq9tGVYl34gqaYd3qoWCm5ihdvi
 jT6Ml6WCM8Qc4638Xq5++xhSSkNhIwULNuOg3e6voXtEsf83KwujAN8y0PmI9mF1pzsUqM0wKhT
 P73ZOuz/n8iQJxq2YMVWe/a95FV4ETu4tCRm5ShU+U2rjIhRTJDEYKNnPKSD3L+0as+dE2EG7E+
 92U4laBBWZEzNbOJ7p4zK8/tZq1gmrpE4bi2et6u0BlOhl974sPZ2B1sgIHLw6z1vKJwUvNoOgI
 ZqZhubEzcFJe250B3lPQJy0Emav7R9y48RYJXqtWa56KlOxPwhhrqYjvklhcqz8xn1FSZghQdcm
 WI9fhrBCP9TU1IdNZcqimV6/q+JX0Js3638G68Z5IPrsr/M2EeZl0Dp6smsMdpgo6kRBVoq7fP0
 Mh5Tiga7HqCzW4eqOyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050046



On 3/4/2026 7:18 PM, Konrad Dybcio wrote:
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: e700bfd2f976 ("clk: qcom: Add support for Display clock Controllers on SA8775P")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc0-sa8775p.c | 2 --
>  drivers/clk/qcom/dispcc1-sa8775p.c | 2 --
>  2 files changed, 4 deletions(-)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

