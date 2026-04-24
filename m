Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40593B7756
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030243; cv=none; b=dCQnukDD8iZxcvYasbubbvNW1JO34Kw0RaiG387TdNPMV4ZenPmZCq61ZhnQmdS0Pd+cx28pAlqfo6aZckYbwxZ1eAKuOwy1wLXWw+Tx4Nh7J0eQcKI+9YaXOZ5lMv1nQvbRsnj9ukHyTeeiT52lO58mhv30Km/FQfcnemMpoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030243; c=relaxed/simple;
	bh=vileOc2RfzmEYgD7Pm9+BBS3DOPaMysWk/823CMJgWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcz/8TZr7L8zWrFp0CDOYAusbgCB3mYvLxCDhsJ4JO3N1MwB+XAtmledQhFOiJKm/ZhciI3MWrp9FgDavTcNI1QGnQQ87S+cEicgMkFxwmiAIJs2jgavPKGyu1KEGYdDIYhqW+Z97rnsVNywvkP5inqzlnYBZqvZsuNsE8f+OkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcqpPRYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qm9ntpPr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcqpPRYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qm9ntpPr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9K2bN2710298
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=; b=VcqpPRYAuhsO+kNw
	1bFVZdoV+X2GaE/RWnh3uBx221N7Uzzim5tbMtoozBTQoRB/Xe20FHbpnd0kKj4w
	YJ8Wm7k9/8PBj+0Kmsmt65OP+lda4ju5o6ha+4L8VvsHHMe5q1XlbcQofQfVe8Tq
	eD3p7dpIWbExGmLbl9GH45cjcXk7FmrstaO2QWll+S0eoH74bwZSXDVwf47Iqs5I
	vE6yiXGK6F+3uivSAhhNYhmfeikIL2NI/k4/AnAYpwqCFWc+oZKeyNpFHbOX+UGP
	9/X3ilHdh3wGGbOYeHkQoPOUNH/0klIdkkHjjZVcCOmGnYtWmG8CvR+IMsleN4dN
	fIlByg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9uvu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:30:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eab57f0e8bso124588185a.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030240; x=1777635040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=;
        b=Qm9ntpPrAjhCwFKa8wwGNgZcvTsvRJggzzRC5Uc7Pp2Of8eUlFF1qTMNvy5OFzwrSw
         p7rJNoRsstLVTjNKPfmCFhTkiFbJbuNfcRp6rXYnRxKMmP3+7U/EmvyLJWNsiNSy8yK3
         RtfNY9u10FOh0A9C5M/nRg2LQgHiJeBWOBhyTecCQ+9frV/RLqLedEFrbSctgFpecqPx
         IaABmuE1X0HJ3NSYWtw3KCnQGGJxGbrAoEG2yWaFmqIg8VkUvBTqNrheKLBv6YRtfVhZ
         7ucn7P3UpETLPiwytlUYTz8yzudXwJMQPa1jkP8Gso24+ztt+aimyeIUTnef8Ro7Z4e4
         OxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030240; x=1777635040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXhU7QcJ2kzFol++lxq6Z9jVb1uM1NWQqGmWD9/Hycc=;
        b=sMzaYFX2fk3fHuiwTagM91osupL0ShrFCpn5N6ROxyYwIX7AIR7So13XgUVRVB3Fkv
         NB0Xs8SV3mQ8RNCPtE2lMlnUKQbPwwGevP4plbn910/nsvOSOEC1hfakUA5B/RWlLgb+
         TD6ngnF771HnylN1GgKU8Q+bbchD959342RvyWjj9JBy6CbOeoQtAX5Q8l8+VEQOdmFe
         C0y83vLxhhh/xuImTVl8ypRlOWG7hG9DX8TYDZ3OEhMAQ0QP2DBX+DmpawqgZLl2fl2N
         DS40B8w3mCrp40PZ284CN7YYyooWsTxSegFbU/tdJmlxn+6HgNPYkXiQf2RwV3dULxwN
         SC1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Unw71jO0rjqUDTZ9cGJqTiKMOQOgfgUGXEG0bYdFy/uFAglYeNiIWrVzMvjnzTNiPpllQEE5Fw4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYdGhZYITaR/lSmfGMPgrlSEE8q2cVsEfsD+yG8OA1vBB6O4+
	Bwo15fMZKmCbNeWo4KnSygAJo+nyzasF7/89YsckKDAPOSMiodz7oQT4VZGgPO+F3P+7TH+H6Ld
	dOP3f0IAhPf5ZY9pfqNbhSYvArnxoB+H2ZefX8jTu4Ze3tOZTzsQ9pJu0RHCuMfc=
X-Gm-Gg: AeBDiesAQ/Bl8t0jgFMnJJZnsxjs94nGtCbVPU5HgiIO5uNTdjEXyIApNdX3Nw9YJ9L
	4eiKytQdf9rNKpyh0W/EZbNUIIXaCuzZ2D6sTTjkW6xjHKEVCzg1fPtM9Ikf+ZjU7/hOuSqVApw
	HvoFsEwsCC+jIMMr57TgqCBsRAmwdIbEfJCjXXwSAhGCowFAIXzJfZDkoIvTdgAg821K6Pome3e
	OcxJCSWWiRunve3wJXdmqOIgPVCOiYlPp/UYLwYnvp0qFEUX/sTVP7QChVfe/Dddb17zU52lEUw
	mSO/XvbtuawoZCujG/Nz8KhepEfD6cU88GQKJrBJnYg42+8Vkj5X9XHQSS/6g4Blo827I4mPQVA
	e5XDkUCACvOqtSllg+koiIoZzXg38r7vhVWB78WzmvEV0KomyiGtoo9CycUMqITTFFvq4Gun0bv
	Xt0mBgEBhfVAWU6w==
X-Received: by 2002:a05:620a:4101:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e79217c512mr3005250885a.6.1777030239926;
        Fri, 24 Apr 2026 04:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8e79217c512mr3005240785a.6.1777030239300;
        Fri, 24 Apr 2026 04:30:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d6f63fsm4763703a12.31.2026.04.24.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:30:37 -0700 (PDT)
Message-ID: <6ca50a86-0b2a-4eb1-8873-cb80f893174d@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:30:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5HSQgD7F61XZUC7CKGD8KZLYY6fWDEbt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX2eCxSWG7CpFr
 EFp4LoqkNsTrQOQhdpXlyZuCEDLFuCdu1jeFOlwl5X3VY2kB8DDa38GzvJkAJUk5T9OyvG6PqSY
 na0mjLfdXwg5ZEXY+jT2VTDm4hzJSQ/C6Jp8B9e3bKfTnAmEGhKI2oHojMJi95G4BOaPV2WZBG5
 28VCDESOzjh6bROeo+yunADXVW0+mlxMxlKAKzO873mnBG7RlbghqVzJwRfzNr91lA0i0GGVU1A
 NgCn6MrL78+v6puO9gVB5fXsriK3HN0U7Y7J5YKPzFh0bkJjBmcx/tuq1GyCySuHGSmMy6kj/sC
 hpS1Ns0JBx08o7fevuHrD7R07NWnMwEIqZRjbifnm1Dw2n/8wEIXZwZfSjELzCOFl5e/aRZQK8M
 s0cpI44sUogVTstqS7lIqtNCjencDTUQ3UREihhaaG+MEv3noQJb1z0uMhvMUclyryd/FHzv2/A
 LkxBc1qqivgf1uMhKHQ==
X-Proofpoint-ORIG-GUID: 5HSQgD7F61XZUC7CKGD8KZLYY6fWDEbt
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb5460 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yenN7Bsoyp7keh_6dZ8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240110

On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
> Add support for the global clock controller found on IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

> +static struct clk_rcg2 gcc_pcnoc_bfdcd_clk_src = {
> +	.cmd_rcgr = 0x31004,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = gcc_parent_map_0,
> +	.freq_tbl = ftbl_gcc_pcnoc_bfdcd_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "gcc_pcnoc_bfdcd_clk_src",
> +		.parent_data = gcc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
> +		/*
> +		 * There are no consumers for this source in kernel yet,
> +		 * (will be added soon), so the clock framework
> +		 * disables this source. But some of the clocks
> +		 * initialized by boot loaders uses this source. So we
> +		 * need to keep this clock ON. Add the
> +		 * CLK_IGNORE_UNUSED flag so the clock will not be
> +		 * disabled. Once the consumer in kernel is added, we
> +		 * can get rid of this flag.
> +		 */
> +		.flags = CLK_IS_CRITICAL,

I think this clock is normally governed by RPM.. is there RPM/H on this
platform? (doc access still pending..)

If not, what's your plan for this? icc-clk?

Konrad
