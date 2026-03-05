Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6C5288B8
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 06:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691370; cv=none; b=u9n+J1OFKIUdvXtFj833Nk1Kc68+AMD8aVzaTpiebmhFXJSEVpyysgzJ2WQUgrwbrNELH2CqkhMSBDBjEmhwKG1NZn8gWKE9BrmZnRiT7k4wckB6WU4wdxjG6k0XqtaspRiDDq8aWkITc8HoJlGhbPjSDd18XU+mIAtwhfFJ+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691370; c=relaxed/simple;
	bh=Ia4Yz4KKVzkSh/fu8vsFIuw10Cp+EPdBgiOe1HDakOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frl8TZSQqLiWn51SFI/fyGF5lElaSIskokFinQSdBJNYt1C1xOAI6cHdkodZuDUXKwoz/3LuJe3HLhjfTJBVHUhE35xJsg5AzPtv5YU0ZPo2aeWkqMbmVjyzKzvuCvayUGpZmjenhTaK08aYnrawJK5ghltMiFeeFU53AqSyEH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lh6ZFJe6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fwRCO2NP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lh6ZFJe6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fwRCO2NP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BqE13482774
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 06:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yT2bh0pqUrT9WVafRDTA0zTBFOOrY+u5lkhZrA52Tho=; b=lh6ZFJe6LjX3lSSs
	Xc3jZMcDbSfmpBWEFQJzucS7PBsrDlB9TCckeWFBkF5Xu6XP3arQfx1u5rWHAMuV
	rIQ998wkBAWSElQhYYbiePZEZTEHDLtLw+EZAaPIpmiwXldb/pM61ZP2OT3QECG8
	ZkzSmFyV9Ab1SqeNoI5sFaW9W5T5AzFDrMICuJr00yyjuEwvfG6oHz3S0QFUxX9i
	dqNFIUGqjRjLxRvJkNi9X3vYY6RO82hmMEVGfYadkkD4ix9VrORGVtERFr55LPvi
	veX2ERB0PST/z4KeVkqtOojdFxMP/TqErAbDwBHrnEBqUpwbToXw9A08p/2953Fe
	yZkkmQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wj0gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:16:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae49080364so35862525ad.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 22:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691367; x=1773296167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yT2bh0pqUrT9WVafRDTA0zTBFOOrY+u5lkhZrA52Tho=;
        b=fwRCO2NPv5iiJKbHGRY9awyRsFiWq+NPo0Nk89y2T8gf1B9JwIkHtLpr2LJVpSTxj3
         PNVxg94Y8CiwEkpIhyW9tmnap7NNaSR8us/mYirTD9gOwiw5cz1ddMwgfjxkU4m2Gby5
         xeiIVOQUWiVqkwOshjQDpESNKdQtCY73zn1NsSqhQA4NrJ4LVD5tGQ1DEl4zKBg6pEJb
         /boa98bVe9Vc/T09zxx8P30logM/AldlpkTVzg2r6LfkkjEAOIs7PvjeLaivgCsdsvAb
         s5rz8j2XMkgv3pXlY42e3oSzGO4tfxGenMCherTq5RqdtHV4KRdYKdxjumN8/My8ElOC
         pYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691367; x=1773296167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yT2bh0pqUrT9WVafRDTA0zTBFOOrY+u5lkhZrA52Tho=;
        b=r/0jKp7EoGjlMbntURbFNZOfgpHcU0+j9+GM+rRHAbaOstakVmWgL6Q21f329ND6Jd
         dkSBGfMbl5RvESe6XMTJdR7RnV8dxiKL/M4xn730DB1ooGHqhWVyoRC0BmBqDQ+wq5uy
         tn9v0VG4Hn37NL6bL3hO8Anva/8iHeAydDhR9V0XZbRvzHrFiT5VsR6mNMw1IoQrLX6G
         dFK5L18JyAClKY2sMjzqPeGsaV/K3KacuPI7xbTw5fr6PjOA/wmFR6jHSrVP1WQ7GCjq
         12E0QOxNDS3Rk/oNcrUnp/PS7eFUWKJGC9qAlYAMmdWiqd9iusaKIo5UHFgWiQH/dgmq
         zcKA==
X-Forwarded-Encrypted: i=1; AJvYcCWTloKALM0GKvHlSVIXWydy0q7O5SGoFNGsXRl7ow0m5zGheoeZl2sQM+wOz2G9z8ygc73gwzygYRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsodTtH2sSX616VDPtSDeF55HVndOE215TnOOgqrAQnUl/VF0v
	RvJJLpv+KCQfYBGmDH0wFIOZaVBs34PyLsz19nUOz64HZn2d8dgFTl3lzn+A99J74ZOTY0DUd7+
	odr6noBODndbc6eT/XugDgJYmh6inyg0jK0m9q3BGSazfpUPWjpWUfMH2AkaXxYk=
X-Gm-Gg: ATEYQzxuFJCuwpLVsM0YjhirkGEvCCUQtWDGlAqtXvzOyrQtOTExJ5QVcUfH+9JY7pI
	k8m4L4uFewG5yJ1SbZB4m/jVPPeYpwQqtuESv0mCBlyTKBPrvNfQhgZcscvLq3xizaFN33Jeace
	EEgcO99VFHPyBoygjZAdMy6MOXuJxJk0/xaQz9VbCLxntalciQssrbtJQtmUwywwOxX0+M4hgUQ
	8nYVa4rWM2Zf7PT7MLmS3XLsrcqoUwhl4uFsGcfOV3AJ3+jxmh3tebsE9mAWjt3cLfhTV/Zw17f
	gX1UNQn/2cWsC/OliRQ3+a5hXibidqN743I9gjP0PGeI9vr+d0oW5+GdO3mJ3D3VYJQSuz1K1kT
	H8b7lEoLE0up+F1BEb7R1cWUO0QThfwDEjrFugOoYEcWs7+7tbw==
X-Received: by 2002:a17:902:e944:b0:2ad:ab2c:d258 with SMTP id d9443c01a7336-2ae6a9e3f1amr44416235ad.14.1772691367453;
        Wed, 04 Mar 2026 22:16:07 -0800 (PST)
X-Received: by 2002:a17:902:e944:b0:2ad:ab2c:d258 with SMTP id d9443c01a7336-2ae6a9e3f1amr44415985ad.14.1772691367023;
        Wed, 04 Mar 2026 22:16:07 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5dbac7sm287061035ad.37.2026.03.04.22.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:16:06 -0800 (PST)
Message-ID: <fefc35fe-e673-47bf-a1fb-364605cdc622@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:46:01 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: dispcc-milos: Fix DSI byte clock rate
 setting
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
 <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-3-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Q-IW8X-2a0ZZm5LX5zxwcUG14mchHSZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfX2FfPnWzx+9CE
 00eE4cy+C+L69ARa7/nXP6jzGiijBRsGn0BGXWj2ITs9iNJ/L7qWJgs73k1BSDLj+cAmalzLCRx
 0mjmBfO8KXqea0h8U1z/5YNe8hE89Jt4L03PwuO5IRbwZrODWG/8qbj8RhfWcqwwBdeZnRUtuMT
 k0hipbAw3vU+fYHffzRMB2IsDtyWsjJWQeFZPaJgdS4r8LdCp17tQDSzliQsdq3aYILLmVmZzny
 xcf2HXrbjSZKpweyRId8d3+wKjGV1mia2fns555CIC9zajm7ilImAkT/EA1w2jkJ/ZGWWmg9SBN
 gmyG7etwvIaYdvSA0PyeqK9DxBlbqx7GRjiw3kCVIGkKQzNxSIk7cNOGV7jqHrctbH3gD+MqyQT
 QxFX54WPGIs9o3rKpYY9BM5fTjJ3vZT9SCA8tt+0hJvtO2cSiAIdx766QIsznH1MEv8lTB8xPqV
 i0G8g6fGxdZPWWy0+3g==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a91fa8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-moZBm4D9L3eB_LYtbMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Q-IW8X-2a0ZZm5LX5zxwcUG14mchHSZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047



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
> Fixes: f40b5217dce1 ("clk: qcom: Add Display Clock controller (DISPCC) driver for Milos")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

