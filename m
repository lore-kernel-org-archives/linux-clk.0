Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC80341DDE0
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895785; cv=none; b=sW/sNujP2MMinzRjLtvLhd5LKas81tFZM3We4aXYsKhIW81rHHNPDg3r8uJr6as1E9NXscmOS/AW3x6qS5oiSkUYmlxw5/3suQroERuersfyrq+KDpn0EJOM94RqfXx/tsrPkuIXKKhc8cGPB400BQPb57l2MUa3a6ROUjhVDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895785; c=relaxed/simple;
	bh=eSJC/HPXN3YTKNn2Z8B6fMEKeWRVybcLVZH7mVe5aGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUEkO2GALxAfzCzdOf/tL63MNrciZF2ImgQeWfxrVXtjtk7Oqs4JmRpO5mjgqYaHLvM+6wZ41OnfIC0OSZMJAhXI17Tv/JZFhTml598Bnl6q+j8gwVay712MKxlZ9BzYhPTBg5bJvn8GHePcGxwREhFy/Zn0jlw88quEg7I5wvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOA7KUZy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vg1eptdd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOA7KUZy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vg1eptdd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADsR22616240
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 12:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=; b=XOA7KUZy5pk6PVqE
	Nc4Ta5bdbp8FPw6UN6UBTUZItLw0RamLPAjQLYfYFfU9f4lXXakwv4L3C6ubnPOE
	Gz5PjVhI9ZSKdTodG0gQkr0fDrFr/UK5ZBn8MXpnOy6s6PRAIyL8KyAxQoxlhNjC
	65a6mUyMdFY2D/Gn7SB8VIkqPnvGrHPSa/fOrND6nJ/1OZSPfaIMhflF7kMKN0vU
	dPfPcFOnlYFndTitzlIk70aHKkSOF90ZQOiq0UckkepiYDHd+pskcC+vHhDdNrt2
	iCdJR8NASVXn3e63hqKiGF1WTyrfKhFja8u5FDEKyNzcV9FOFwuwvu942F6C4Zgy
	SlLV6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw9qgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 12:23:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52845bd815bso849801cf.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 05:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784895782; x=1785500582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=;
        b=Vg1eptdd5ZDZDo9lMWaUim9m86/XWDNiq7gEh+zU6XMNI4RHQhYZmiSfZ3c+v1LykQ
         4IzLy6SoGcviKq2R+vHryPdXhOPaM3kNo4aUBn8/vQVKjC3kJHYyPm4XiJeEZ6FoFhq2
         n11umC90C//UdQMyF0EM+KXG1CHNrYJXttadXrAbgE/Lvep2DCp0FCpptnND31oZ6LKp
         XWSgRvFjByi6mjeb/sgXt/6vKVdLFukeUddXyw1rvaBwhFpuPbtlKV5LY/RJyhZCkl/0
         aAUNLyP2xkNjNDlimVe/POVlGvovv/c7kKacUtoQdwdkUTgXf+8D7Si6o4OhnIL6mrMF
         C6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895782; x=1785500582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=;
        b=EcCwRz+Ltzgz/bbD4bpEMC2w5EkLe+xHEEfM6ezAChpqIQqbX6qwftQxgxrpAJyBsN
         cn7UkhiNNC9LqH+WWmyWJnX0o/Vdvty2WiJLjt+gr0Vs5jLicXqYhnyOFzBmKIR5TNf2
         SOyXZT+x3psImKxuHmDvHHaACVp1JB/b/eSzxmrwaI0s9AJoexqVn3BiKuezD3bpKPTe
         vLZywKWnx19FuHMRw/eqf+nRInnhAe7AY+rVRYEkbf5qNjcy4BouMk+AOVOrNw7wCeQl
         wV4uwU29dHO9Jt/D5x4jY7gBbF4sI3eSixzfvTv5xQtaPM3mpMogWPH8LKRwMGF468Vl
         fNQw==
X-Forwarded-Encrypted: i=1; AHgh+RpxohTPJP0qegnPMuVPdMEcHAn65fJ9hO4JRyljlxAeVpyrg59txbF1+uxsFuywI0+Cs7x6NQgKOd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9hQz5gp8U7W0ZtoxqV/eWnG6Ae3WLmCgnpKZFKLJl7Yupn15
	0ph4A/1/LiR39t+q9ITo8wG9A4sYqaPBmP0j5xbUKVnnsrluC0KDuwZmetkZc50wSoLZA7g4y8u
	VyL010R55dyPUlL6RLOqp94ASCnuepP24lkL6L3BC4XYK7eiioaO7Y5tGFsZdZKc=
X-Gm-Gg: AR+sD10yd/sajEOn3GGfaOXiOb+rs0vCGVCQz5Efq5dQGVEojKlRovTHkrgabv+zz2o
	EwRL1MPh5nvmS5xcxFGuevSJ67GVqqN5mxPPsVmOgiJbuhwLgD7KjmTxGiCmxGgrt+MYxIX5OG6
	a3bYG1qFDcUvh89IbSsI4n5fPeOsc9s+uWhhX1eivuu+rJGF0pypV1NbEwfixxFIn4+n5v4TZ0x
	1EFp8W5K0OJqS68Rct8rNzBcp9ydpdUYlhGne9/OGB4A2HeMdRS1LRFPoo/dqz7bAABozEV+n8S
	HKVxswLNzeVCjESNabEnn7onWNg6Qm4CL2euXyVY1NqdUe+oUI2zfV+V9kw8OiVNWnxFjpFJljV
	J6ftmbjMRZDNVrFMQfySg4z4I
X-Received: by 2002:a05:622a:6208:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-528496c5744mr31381051cf.3.1784895782018;
        Fri, 24 Jul 2026 05:23:02 -0700 (PDT)
X-Received: by 2002:a05:622a:6208:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-528496c5744mr31380561cf.3.1784895781535;
        Fri, 24 Jul 2026 05:23:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebad78sm339747966b.46.2026.07.24.05.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 05:23:00 -0700 (PDT)
Message-ID: <720eb684-ae89-4003-b167-e427b4d31add@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: clean-up simple provider misuse of the
 consumer API
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfX/p2uuaKgq9s1
 SESooY445Vra2uj7JtdrlhUDLua5fdzBm34wXsJ+qps/sodMBsEbbNtoVFfVnDlAmr966Gxrj1d
 DSJA8dCOUUTujF7U8yUYdLNdtodcIB/ZHyCtB+Dct7M5POr5fHWjREm4gY7L5kh//1DgufYtwKY
 5T/QPmfCqBd+obIMKx2jiz4dUnNq0dhmhlCKCcjcK48u2KkmILZ9gn1Mhqxu9X6iGMDgHx+F+pF
 2YPo5wZTQmH49LtJ1ME+n7P9wNrfstn7dRSOGp6JPaeUqoKiLk+Mb+MsqjSzjIx8v9pVSxKy09N
 gUwaVAJeqN+WQBHx5CuTorqZemyS7QFb6rl1MI/Zq2FMFHB1SmUax6cX64VzhNNmOvhQh7HNg6+
 7AyJXWdPWz/ig+TVTHbiOzJFMmfe0Q731Ggmn/2htDep+LgsiPKCQqP7PW4HxwkRvAeZs5ss5hO
 EBH7G+/SVQaWy9YU1zA==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a635926 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=4bE8Fl-H3dgRu3KWX3sA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: jUSA-wgenTWq0RN-0Xt3ZOmxABUsjbCC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfXzyX+fk5D3FLd
 zH/Xy3MKYv7eet7AeGt3VzIF1uKr4v5RuPqFqaEQlYe4cVrZjVBt28wdJe+r1GWL/LqSugIXf9S
 tw0iNpGlX9O9wPDh/LFX2Al8h2xESAA=
X-Proofpoint-GUID: jUSA-wgenTWq0RN-0Xt3ZOmxABUsjbCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240112

On 7/24/26 11:03 AM, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
> 
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
