Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9630253F69D
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999101; cv=none; b=o/xnpM5WXmM8uCShlDvbIP3iGTaa+VQWNh7O4VG7PfZr3kPqh9cFIc4OygDtQtSF1E4+cPy1+cxuODuE2ZfAfiwRXKxhL6HL7fN6X/JwAJlytvCfz5Nw1HBVtVhKDPYO/CdLALY6C6s7ZXtFiEW5V2hNpzy5bwqbZfRAJKumAc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999101; c=relaxed/simple;
	bh=121EF6tgvtQmCI553ZeF6I+UbkvEWY/a0feXoJuQ+5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnE18wJjfYF4P3CH6VOzWU+PDRELWGfJr48/XkiHeDTraFp531v2anc9l8fdBQTVuJwQKbmBLYPiLwZzNlgLmqTkfqiL5yFAbR0p57VZnm2mlugv7YSuzagpoCCr4ODE2h1HPIyqviSyrzmHTD4xuUKfkXSVXbRYLayHOJSQGbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARxqgK2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFtCXLeT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARxqgK2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFtCXLeT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbIHP152354
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 17:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lkj6WmLM94TLi7LkJSNtIzaP
	frHo6K3hQ/enHwG6gPU=; b=ARxqgK2zwJNKzaI+JAXUrYvIyxi3iBuILGUfZu5o
	adNmbIs8cWR5bF1mcjdLC0X2gN9qfEbH5rtrGqt/iiKhw8PLlCev2O7dmQfnMqtW
	pgEsyddaZngCo70WOSYUMQNnAaZ583vLR46QT1445VfJPw9lY4T7uiejGi1miA8E
	w2d08GyguICu3r0vPDwOT11FmEp0dlWkJNcqXBdU/5DC57wcZWisTRkKL+fk3vQY
	mfDam/3cu1JN0F2NWJ7PsquCMfR51cnlosF3wy72BN6NsSGBrZaHHdY9GRs5W8F5
	7qbtWK6e9GOeVJn9BoOdgtVz9Y19ujsO4RSKLLg3NxuYLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aehvwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 17:31:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e46b4b700so107514885a.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 10:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791999082; x=1792603882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkj6WmLM94TLi7LkJSNtIzaPfrHo6K3hQ/enHwG6gPU=;
        b=kFtCXLeT6MBACSh4IlLMnKSsVpYdHJ/oTsMR42WSMsBU5l+EvmD0YJ27pjRTybN24n
         taq3x2X90sRkDg3td0Q2g3lVnXa7jp7n6ysdBMJ0aP26R7LFYybjx4MvWARa9zZVjBp6
         kqHdINzPJcFTK28t4AZ73O6sclpSErqLZnE5qrhdut6/cGqnMHXJc2pLEwsajy5i6sXV
         TMy7olRJTk7DwAyDBZSP3rZDJK1U7rtJDt8WMwAcKBC9cJIsae5Al6SslioSKhJN7ITn
         2sxMqLrDkBk67o1h/U6Mc11CMIA9X2n5UVL+3YydTWko0DI3dmQtVq7vfXRyRG3nOMeE
         DI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999082; x=1792603882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkj6WmLM94TLi7LkJSNtIzaPfrHo6K3hQ/enHwG6gPU=;
        b=0uyUD+lUhWzTrYe+jdJ3jPMV+o6H9QQj0j1ptfzYrSSMWddbcVwNZHqJ5YO0mvK+Dl
         W+0i2Ja4Blx2qX0b6rudO4McFbYOoWjxt25tTTznH1uXqIZhNXqAEXRcSuK8O3Xdqm/i
         Ib1oEE8f0Y8QtesqYwAON4qMXV0xUAzblgbuO3vUavaXn7oCtH8nWX4coPbaO3q2U2Re
         Dj2CPpxtzabrJHoQ/UjFthi/Gi5JtKx79fIwwBTi5m0Bx72i1FwrMgaCFC1RL4rJxGqJ
         6TJYnOLLpF34M51qGJjQrDaUG5B7iH0eJu4R/GhEy7ivzsnAVcbw/DIO+Jydv5WgBbgK
         r+lw==
X-Forwarded-Encrypted: i=1; AKwUvByhWSlXB4b3OFCAjGqIhjU2YragkE1f6qq2cSy489JTYxh3QrtfaN+/ffTQP6XAMddJBLQp/Mx9RH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc4rFIsaQOgyqgVyLam1RVeZTGb3YdemwJyJjFXXj+URECvc+V
	V3ZhuUcTiMzeLXHdA670dCWQncy4CBY4tF6TPZtR2NKILIr3dwxd9FGyE38NO+eKpRpvdfNAhep
	wkHESgoCakyeAQnwfpaY1tufsjZ9h2rNDWKY9Yrfja8cbSUyEA1O+/AVsVASTdaw=
X-Gm-Gg: AYBFou26bzYL6+c8xsYN5t0lfHdNVwP2i4zDLGd/Gi3X+3BHxvWrV7kGebaN5ek6sZ9
	gQz/dTV/p3tW+U7eNnNuOcCI77P/bqQR+SlyJ0KZ/mBvxdMqv1xKf0+O1usYKywhLiANpo/dugd
	zj/qMBK9Ketiu+lAnYPXCJqVpo6NbyvfdWkzv/JL7rQzOXGMgdkH+YthTONuzlai/0e/YuI0QK+
	T1LH7sSrR7EgNbPr7Q1BQGZtg5ewLNhC9XuBJJRR1uKpmTZGcEwE6/USVbuQAlyZOwcbA6vo7eC
	aQT6jETqvdsu3JTD6is1oSMtJ0ekJLOOo4/JV5c1vySpree1XsNmJFiIU8DG1oNGvEkkIqkj0XJ
	dQ9YAobfozzGR2DgrIEJm8zjd8JNpBpaYc6U4zmzmGZUNkYZ9rmjSURWI0ApXbnIqqzYG9XiQX9
	Ic1ZHyNlDG+jBa
X-Received: by 2002:a05:620a:1a1a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93ebd22932dmr2719651285a.47.1791999082205;
        Wed, 14 Oct 2026 10:31:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93a:1b82:4962 with SMTP id af79cd13be357-93ebd22932dmr2719640685a.47.1791999081425;
        Wed, 14 Oct 2026 10:31:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93de0sm789552e87.67.2026.10.14.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:31:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 20:31:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
Message-ID: <ussxpger36nwnvuqv4nmtogxkrn4krogw254qbtusdf7y2ofn4@pswnav4mz6lm>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
 <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
 <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
 <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YSpemsMDK19JvkgRcVx8CQW4guGzdktJ
X-Proofpoint-GUID: YSpemsMDK19JvkgRcVx8CQW4guGzdktJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX9B/IlOox3ZWd
 vDKh3Ii5TVwUByTEOwgN0SC5KAymUO/Wgsl6Qo6BJ1kNk2+Jj6Roz0CO10Eq5pZTzNN+pCSnuOl
 ZAQLzYp9HFW6Vr35oBhbC+5HrP3mCN8=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acfbc6b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qblbxwZfGeKRjrM4MhMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX7BOX5E69eJgf
 XyGp4ykKiBIQg7bxpuXjh9+kfa4JqVYs+U7Kd4hRm9PcfrHWUscPYOg5oJM8yZ/o0OkeU9rV434
 Bzgn/wGc7WdmnneXMs/Qc7kio5v5Ua+BS7Bod5iXv/JMhoCPQ2WQTuPjkwqTP4TjY34Fugp1IuL
 I1qKtmxIT6VwOktAl5ZD8zhcjNOtnVyfkmxmZ/y5ADKR8z7Rb2/Xm+6MU+J10Mm/fpS+f9ZKsMZ
 p+57ogkYXHDEdgkJsdIn0Bkss4Z76GXc2JJIx3MP0ekT5nn1ejIowFElQciv7BsrHwNX6SWF6HK
 6JK9V5W0X88ngKKgTkAxQUXrSNsRCcCHxgBpwtvWIdq/1AbQGly6PeGOkGO1iZXaanXYmzeV3D6
 D1R1VCCNU1lGNHbgRRXRQO3gfmWwvQiOt2CUUr00zVDGdh2k7Pv6Rsk+TQvgU72oLEy5/j4P5je
 fezN6THHz8Sdk47XnRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140069

On Wed, Oct 14, 2026 at 06:45:46PM +0200, Konrad Dybcio wrote:
> On 10/14/26 6:30 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 05:26:00PM +0200, Konrad Dybcio wrote:
> >> On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> Clocks on Qualcomm SoCs need a minimum power rail performance state to
> >>>> operate at a given frequency. We currently leave this to clock
> >>>> consumers, so a driver has to know which power domains supply both the
> >>>> clock and its parents. This ties knowledge of the clock tree to
> >>>> individual consumers and doesn't protect other users that prepare or
> >>>> change the same clock without making those power requests.
> >>>
> >>> Why would they prepare or change the same clock without making power
> >>> requests? If it's a legitimate user of the clock, it should have an OPP
> >>> table. If it's not, it should have a separate API to set the clock via a
> >>> legitimate user / aggregator.
> >>
> >> That's the entire problem that motivated this series. The consumer
> >> doesn't know what it needs on Qualcomm platforms. The power
> >> requirements are that of the clock controller's, not of that device's.
> > 
> > I'd still say that the consumers know that they need a certain
> > frequency, which demands a certain voltage / power / etc.
> 
> Right, but the meaningful difference here is that the consumers
> only know they need a certain frequency. The required power votes
> from that don't stem from the consumer's requirements. They stem
> from the clock controller's inner workings that are necessary to
> fulfill the consumer's demand.

Doesn't Iris core also have "we need this power to work on this
frequency" kind of requirements? My assumption has always been that
those are just folded into the clock requrements.

> 
> [...]
> 
> >> The Qualcomm case is easy - RPMH is *always* reachable, so the
> >> pmdomain provider needs no clocks itself. For the other cases,
> >> "patches welcome".
> > 
> > Ok. There is a promise that I2C PMICs will never ever be involved in the
> > clock / power tables.
> 
> Or at least that someone who needs them will contribute a
> solution to this problem.

I meant actual I2C PMICs, like PM8008.

> 
> > 
> >>
> >> [...]
> >>
> >>>> +static unsigned int
> >>>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
> >>>> +{
> >>>> +	struct qcom_clk_dvfs_vote *vote;
> >>>> +	unsigned int level = 0;
> >>>> +
> >>>> +	list_for_each_entry(vote, &rail_voter->votes, node)
> >>>> +		level = max(level, vote->level);
> >>>> +
> >>>> +	return max(level, rail_voter->safety_floor_level);
> >>>
> >>> I guess you want to avoid having too many voters, but would it be
> >>> possible to have one voter per 'signficant' clock and let GenPD itself
> >>> aggregate all the votes?
> >>
> >> What does "significant" mean here?
> > 
> > I'd define it as "using a different power domain or requiring a
> > different corner".
> 
> I still don't get it

When the consumer votes for a frequency A / domain BX / level cc, usually
the parent clock (at the corresponding frquency nA) also has domain BX
and level cc. Sometimes (like in the case of PLLs) it's not the case.
The domain might change or the level might change. In those cases that
clock must have an explicit voting (I'd still prefer OPP).

-- 
With best wishes
Dmitry
