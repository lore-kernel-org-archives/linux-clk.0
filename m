Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463AF56260C
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996354; cv=none; b=jEVVm+Se4Z/VO6LZNjGlMoQ6vyx8qmNVIPQfQualXi8FF/qxFl3CiDWxvf8IvoOEIe4bZQxbXsMJ9mcS9JiO37Sw4ZfwLS+X2JHP6nO9E9Sm3ARKg6esQWOOFzymTUrELN/DQXMZQKsf88sFA2B5+yD/rrayRMOYAhnlsw270iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996354; c=relaxed/simple;
	bh=avmiatq5ycfq3Gus4JRQptPL9QjSFPMI9z8DIWEoH7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gzSrXYdjpqutM1hWDCzh4JG7WqFGxbuJZ8Yh0sUn9qWEd0mEydULLkkHcgXiSOMZfLfVGm99J+4WqTuUAUjLm+1XkMdEN9f7x2pLreebSYuIlQ/U3dyZT3ygGFgT3Z1PIDH5wUq75DXKIiYupcEvD8sbWL9Z79AHNcSXdvGwnsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEzHYwH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOIthIhr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEzHYwH9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOIthIhr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbI4M467734
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOGH9ZC26XcWJ/gjq1+5uzlqR8S1/dn0I31tPVR1QeQ=; b=jEzHYwH934IrzYuI
	ynJmeEIh10QL7DWW/i4crH5aW5gLJqI9MFNYhhg/EPHi4iFypDBphxo4LKCahEk/
	So5w5/cahPOjHd8RAXJjXucGpXKXSNchNgpOjmEUkdPhFuYdXbQDHRMMrvgNikEZ
	n7bDawQlRFRxtN2LksRIpTowMHqEKWRuOSbq7b1a6siGKwn6lP0AL9pT/ppwnYEp
	4Bz7HmB1FLq3QJTsx+Ipz9cqdaMgaKM4yUCJWrh61m6X95F82nm+5BHWYL+BYwSG
	P5Gygm2w8POEDqWZcA30mucnro9zpWojaN3cyG2Nut8IWyXYfiDGfAIULC6rUWX4
	yQ+Opw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphkjvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:45:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so33429685a.2
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791996351; x=1792601151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOGH9ZC26XcWJ/gjq1+5uzlqR8S1/dn0I31tPVR1QeQ=;
        b=GOIthIhr09Zfxg/HTBSXwAPvFbsfQ0htu5MhzSNJqT0zyYoND9eHd2xLJeaT7Rba61
         yfjXpcnqHUUj/TKx9RiD4u7en0UmzqkmqqaElMFsOjVi4Jja/8qNyG8L9TXrecmvyso2
         dYCdDsFlpsupqRVYyVdBG/eiqCmCsXOaMVPKXf7XdA2kem1kXNrOa6Ynxd7jI85UgsWf
         XwgvbhPB86Y7Ma2Pklo0kVusmyJdZPBE+OKM3ODyRQfg7/6lSvJAi6XNObpAU+LGzHtR
         eDqBZhokBEVZcTj5zcoEBHeP2W4H9dp38ajJVH0s8HDJ53hXdV04+OTx8q+KHH9ZxP+8
         eqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996351; x=1792601151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOGH9ZC26XcWJ/gjq1+5uzlqR8S1/dn0I31tPVR1QeQ=;
        b=erlqBTNmG/lnAUozib9z6PnibGdoFcQnuNYaPnQs89wl+mZYTOijtOukXLqYp4BlzD
         AD1VUcC1j+Hp5uiJNtI9A7kXyKq4RwoFaleq5U+eFJ48AWYE55bxeJgvywS8Rl/1AA2z
         tg6n31PcSZaMgZDyqbnFhyOY7bbvKDWR0E/XadjFAj1mFBmS8OfNu0P9Zbeliwq1AhMv
         7teNZCuV/1MrWsuPSXqk9P0qUY3qG/n2wmjYZORMz1u5oBNqToqAlcmaNIo1XMVx1REg
         FuRAoVW2TiMvEFMtSRFk4Hbcu17873xVlvnMacPT3/ltfay770xFYIY2GMWWtX5VL7jp
         TSWQ==
X-Forwarded-Encrypted: i=1; AKwUvByU/u2fqgJC/aURtY70hwFI4Sr/jUh5XiLKjmXYp27pHjr19uMdfcp+n3zhqfn3OS/d39hQcm4fthI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkVo+bvuNKT3zxKcmuMnn0ndVG1A/gY43vjHgH87ZLL0/k+RNM
	/TsPfJKKKiYE8objkgILMVo8GXa8iAF7kqhnAy/RIvAa2ETbKuaRzk+kK4o48JtQAXxZNkkkxjt
	Sdy+iIbDzhcP+Irz6OoJ1FGDG20YfXNB7SrSHafLuls83FQ/VJielY74HngIdTFE=
X-Gm-Gg: AYBFou2N5Skx8Yw49+qV+y6NT31G4g5HQgq7haXPiudGO/FMT505A2vDlxVV0lF4gYd
	4R0e276B/pv6F1yEGHJTrYp79nybyAZHjFqraPq0u1gQdulwfoPTQT8bgpNxYYypTeFURrJiVt/
	EQyTHw7eLcjVpQF+UeTkNoYDCqfRxaH3rHzoFrKQOMw2rwsGLCy7po9tMDd+mqKRETPXRlUuIGu
	HSKuurw2UOq7wywP1a0hYKm9/wzfa8vMdKpQp3oonlbondx2bQ9tt2yCZbSr7gco4o22KupGq5n
	BQPtYE35HDN39btQgjER/Dkfxnb0/QRf1+U79nnhICu0Li0zhm5yCnbIQisf2XUNxvsQcAlzkSb
	lgoayAZcZAreXEVeoVYZeJQ==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3238436685a.5.1791996351330;
        Wed, 14 Oct 2026 09:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3238430085a.5.1791996350722;
        Wed, 14 Oct 2026 09:45:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda61fb26sm4954766b.69.2026.10.14.09.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:45:49 -0700 (PDT)
Message-ID: <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:45:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
 <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
 <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dZnNbwvcXoQfYWnwli8j4MQpkfERZEnl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX+W7JTGgig8yT
 habWxbLQmTqtXtkj1n8F5RijvqUdGaZ+Y5DJQt1l2jhnad0suiWcTLN2p3FEGxo98SYKVkXP21p
 bxH/K0Xv/E6AiM8xInv7kuzMMj8Nj1g=
X-Proofpoint-ORIG-GUID: dZnNbwvcXoQfYWnwli8j4MQpkfERZEnl
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acfb1c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XY6eGlS5OATuIy7doj0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX5MPlumLPmXsA
 AQkvhhOV+vCfLHUw/UTm3ZkoSoKIHkt75WtJAvoJa+pqWAB+l2kpyGR3vUnDlcJru1bn/pr6ESm
 onC6WT6t/MKcaIkgQFz1wLTqxR4+sUT/Npu652WoVgUWHLrJSIVLCzlxk1uv038hVyIHimro60t
 7nDfkkzwaE0rJQvrI5ze1jzcH4ZpSrpFBXWgcTBE8R9RCUUBRrJFn8xYhqVXwsylTkjcsGgxy2r
 QkLNGu/o9VEcCx42ySQ/OAVE21NawJ/ntliBtMz5NaIcDS/mUli3xc0hI5wC3xSe5RO2eYHrRaQ
 Hyzf5rPpVk11JGhYfCz9dymujv4rkVsjeL+c6L+0v5lVoo1mUwv+/OjQ5QzxWbBilfBn63AoKHG
 rfBtrUjuINqBdAqovDfC6qc6wMdQGBRHK5UVuXD+Gt3FglHkQ8ch9oBviX0jlJ1ugJwmhQAAwSQ
 6kgpX4DFgXpypqiIwpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066

On 10/14/26 6:30 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 05:26:00PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Clocks on Qualcomm SoCs need a minimum power rail performance state to
>>>> operate at a given frequency. We currently leave this to clock
>>>> consumers, so a driver has to know which power domains supply both the
>>>> clock and its parents. This ties knowledge of the clock tree to
>>>> individual consumers and doesn't protect other users that prepare or
>>>> change the same clock without making those power requests.
>>>
>>> Why would they prepare or change the same clock without making power
>>> requests? If it's a legitimate user of the clock, it should have an OPP
>>> table. If it's not, it should have a separate API to set the clock via a
>>> legitimate user / aggregator.
>>
>> That's the entire problem that motivated this series. The consumer
>> doesn't know what it needs on Qualcomm platforms. The power
>> requirements are that of the clock controller's, not of that device's.
> 
> I'd still say that the consumers know that they need a certain
> frequency, which demands a certain voltage / power / etc.

Right, but the meaningful difference here is that the consumers
only know they need a certain frequency. The required power votes
from that don't stem from the consumer's requirements. They stem
from the clock controller's inner workings that are necessary to
fulfill the consumer's demand.

[...]

>> The Qualcomm case is easy - RPMH is *always* reachable, so the
>> pmdomain provider needs no clocks itself. For the other cases,
>> "patches welcome".
> 
> Ok. There is a promise that I2C PMICs will never ever be involved in the
> clock / power tables.

Or at least that someone who needs them will contribute a
solution to this problem.

> 
>>
>> [...]
>>
>>>> +static unsigned int
>>>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
>>>> +{
>>>> +	struct qcom_clk_dvfs_vote *vote;
>>>> +	unsigned int level = 0;
>>>> +
>>>> +	list_for_each_entry(vote, &rail_voter->votes, node)
>>>> +		level = max(level, vote->level);
>>>> +
>>>> +	return max(level, rail_voter->safety_floor_level);
>>>
>>> I guess you want to avoid having too many voters, but would it be
>>> possible to have one voter per 'signficant' clock and let GenPD itself
>>> aggregate all the votes?
>>
>> What does "significant" mean here?
> 
> I'd define it as "using a different power domain or requiring a
> different corner".

I still don't get it

Konrad
