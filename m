Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127C5452B3
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988575; cv=none; b=iiQ1VSKL77ACEIlTu5ZTsuRh9L4CXTLt4p+EZAHzhlxSdKoJXgxKFD/QjEqmV/qa9d9BGPdbR78Ii3JqOhDgc8DG7hADZfZxDoj8KiPuk1L6b/1Asc8cLXhyJTe4rqbbk7LUBhKs2lFFuToZ/+eCoOgRF7JZOV2mE0gAHslfSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988575; c=relaxed/simple;
	bh=F4rFBUaCOL5YOfxzVdVtwUZSolYZcsFGUHKO5GRCAEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDXQkOg8Az16sn0n8YHG5drWXtUpPP2Pb+WJshmLKntyI39qo8DcRAuMk0bhIkRQEfmJgkHCoZYfRlL458BMQyP/FLo5rzgSNqaa7fUZ3PdgczOB9fztL9L+VJ/+STTLXl4xcICOFoBZIB+pfUAWRLKY0N74/V7ChVn/leXGD20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwHAZV4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFVEk3ll; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwHAZV4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFVEk3ll"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8mV7Z3000890
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OUrow3hu1m0q48SV2EF3u4y6
	PxIgCefasK/JsgE8vO8=; b=pwHAZV4IzUXXXT040taa5LQ2+q88yiR8qVauSaeU
	T/CHXjUkLGYZVBLnNCjbZ8EltKJRmvWhFNr+cmllwLx1dwQHJEPuXnXmTsXBrjW6
	N0jJnyGGlxdL8tQC466Vl5BNNef3YC/xTwaK3PsrU+D6RCjTw4QAepszjmGBLUe+
	YDKthtMK/9eCXU/MSy8odkeAVa26h8LyWBAzJe+Bf0H+zXVmz4f2VXbNHM/IhCXg
	JoU0iNu474aGHpd96tceGcRcXugAWbpJcXZpUDnuQHhKYmBix3mpiJ+3WRoN7Cwc
	i4GE4DX+sV2nMV+ka8M3uU3fFul2KpkHLxfBHWnyz+rVSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeve4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1291082585a.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988572; x=1792593372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OUrow3hu1m0q48SV2EF3u4y6PxIgCefasK/JsgE8vO8=;
        b=CFVEk3llnZZjIshnmGcIvDQyicDZ+20wRJ/ELc4vvO0hpqQd5Q/ZMDGy/ONe61bVOL
         l5FAwDyL36TEg8dW7WqzT159nn1Yhfwlch8wrZwHIJ1Vnj3HpZbXKwhdLL5yjFf1F2EA
         wFBsrvw90XFbcVZOnCnHnRBUs8dfZ76YX9SCgmxpfiRo2vwL1MNQNpOD4M54uUK5Yq0J
         owNqp+DlsHa4Zq9f7Vdr0YXqQlwYMWEFxPxA+dWEr6EuxzX87fp1LaexN85nFDU2WXph
         24NWGNdWvdAn390hR8o1WT7pezaEj68jCZ6Mu/VFW6mIocOz/u4vgYkUhj/xodVrz6Fy
         vTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988572; x=1792593372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUrow3hu1m0q48SV2EF3u4y6PxIgCefasK/JsgE8vO8=;
        b=qWfS3XkYbZjuQ0oYzDK6yHMXEuN8OXogAvReW0KMzu6w9wNofykE/uzJ51n+vLtXXg
         R9xPllboikojs4FyF2VJUdayqg2nXxA2yaS2YIEr4/NMV1a0oUuu2bwIJUaY5hmD/VVe
         t/2JpNXecWv6+UHo/er3bbYApLvnBVlmYAh1D2GKU9ovCydOf3GLhkkP1X7cdQaceZKA
         341FdZygevKqW8bNgvnV8NPAlRcDxg/SP/ZnQeYcc0QRg40MDZ6hQz0M4hGq1WUfA+ay
         W9iRepWjK4xXiWU+YjCBUhZEBnUdthiqDBSeXasZhzyp/hxrAyZdXdvwgOJhZUZHrjxv
         8N6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwc0Z+J6QiLLeEK58Xzh4GdgNwdq5b/07q/yxUO17WE0vKVqun9nVvB+tBhggc2W+2Meh56nh15Js=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxkdCS4gC0nnfsnE1sWv4ielnCXuve0I1jt/q66nqWC9IRYMiZ
	9MlAmjvfzsEZrZXZnu5bYCK2aMivyJVhNqm0JlUS9CwkVoRZ+FqxYDSII+8A0DuhyytXXca9jpr
	AbOw+lV2JRtMfP/wiB1oipPcVxN5EBZRIHsvbdP5lu94L4+lsw14x772mz7bj0Ek=
X-Gm-Gg: AYBFou3HFZDV8lcOpvudVCInhksMVuYWOBVZ1+RoFGi3jE88qwtvaT5YTQeXkzIzEu1
	CJkTOKkV9Ap8HPwhlbyeVdo+t11EcgTm4aww+QOVIodpJ0wqT9Q2HG5R/e82CvJZYXBgROrMjs/
	ByKh7Pv3qjabTUA8SIsilRrcCMlMxS/FdikEO1YEXz+Hr+AnN3ZnD9tAo74S/kdfcRtZQuvDqJ+
	LndVuLsZLaNaE3xYWzuKqufgbwqRT8nYyMreVOPRQhp56gD/ZEL+USx6eB83QWIZqwcIrHqVyfG
	kiOWbytn9Q00oumkpens9nEs7vmnigeRv5QTy5/Kw+4siVzFxrps6ETHCe/bAzp2jpCsTOMCTPN
	rFucZm0joVI9YgRZBobGMZ8WrZxfSBpCwp10gjPvLoV3ufrtjkvfL1Oew0tpLL3GTZVtYxzqGBT
	ZAhiTZmbt1PtP4
X-Received: by 2002:a05:620a:40c4:b0:93f:116:9873 with SMTP id af79cd13be357-93f01169894mr594351985a.7.1791988571545;
        Wed, 14 Oct 2026 07:36:11 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93f:116:9873 with SMTP id af79cd13be357-93f01169894mr594338585a.7.1791988570422;
        Wed, 14 Oct 2026 07:36:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d976d8sm683084e87.68.2026.10.14.07.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:36:08 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:36:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
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
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
Message-ID: <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: oCyvwkpSraFdUUaDnM2COez-YzPQmLmh
X-Proofpoint-GUID: oCyvwkpSraFdUUaDnM2COez-YzPQmLmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX5FAY9kSUEk9P
 coRKC9ntCv3w+3wj6ert67tMrsXiiqH+43p0jG8oFVt956V4+jRVWjBaA/ATNdg0cJqhIDYmnW5
 c6R8cSw/ej90NXbt5nZr/2eWkOLVdlZCKvNcI8zixw1zGvT9s5hR8qftrfB6jC03X/7lNFuZMbL
 qWgl1spbT+lutobi3IlkKH007RHY0FJ4IWqaBvf6Ns1XAD3U0qc3QmoxMGM9TM9MkgsTWrIAQ6g
 tya1E6KZkWjq10rqsGDbueS8gqerBJIxNqcWono6ok6GLsux13ck9WolzD1VyENhcrZD9oZZ8XI
 +8PjF4/RQP7BI2d2w3X3gTKzQV4uCpM0yMr/nCHdIETzEAGwvFHTpCcgkN4Qz2jLUTTg/gxZPMR
 EB6YdBWUyzgSWktarGKn1BOdF7dJET/PEANuTkzgCyRX02Rti5lZM1fabnA+rGeGZZhn9RUO4hq
 5FzTtaNuH7bniGqyFQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX6Dzk9BKGfg1+
 Db+/2Roq/7hvxvTBEOm8XJZjRRBd3rOOXAKKPBAy0r7jFM4gXGOZB45WdNhXr3nrAdkdCXhQDL1
 c3xsAgf6kWM0APDCChQrllLR8QUsr44=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf935c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=XRegeI_o-g_BgEuFQC0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Clocks on Qualcomm SoCs need a minimum power rail performance state to
> operate at a given frequency. We currently leave this to clock
> consumers, so a driver has to know which power domains supply both the
> clock and its parents. This ties knowledge of the clock tree to
> individual consumers and doesn't protect other users that prepare or
> change the same clock without making those power requests.

Why would they prepare or change the same clock without making power
requests? If it's a legitimate user of the clock, it should have an OPP
table. If it's not, it should have a separate API to set the clock via a
legitimate user / aggregator.

I see one usecase where this would help though. If the clocks use
different power domains and the corners on one of the domains don't
match voltage on the other domain. E.g. it's not infrequent that the PLL
(powered by MX) requires performance vote change at a different
frequency than the rest of the clock tree.

> We can't simply pass each clock's request to a shared GenPD device
> either. The device has one performance-state vote, so each request
> replaces the previous one. If two clocks need different levels on the
> same rail, lowering one clock's request can leave the other clock
> running without the level it needs.
> 
> Move these requirements into the clock provider and aggregate the votes
> per power domain. Keep the highest level needed by prepared clocks and
> in-progress rate or parent changes so that one clock can't withdraw
> another clock's requirement. Use separate virtual GenPD devices for
> these votes and controller register access so their power requirements
> can be managed independently.

The biggest question at this point would be the locking and lock
nesting. What is the expected order of operations? Currently it's
limited to pmdomains, but for some of the (older) platforms clock
supplies are expressd as the normal regulators rather than pmdomains.

> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Makefile     |   1 +
>  drivers/clk/qcom/clk-dvfs.c   | 574 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-dvfs.h   |  40 +++
>  drivers/clk/qcom/clk-rcg2.c   |  93 ++++++-
>  drivers/clk/qcom/clk-regmap.h |   6 +
>  drivers/clk/qcom/common.c     |  26 +-
>  drivers/clk/qcom/common.h     |   3 +
>  7 files changed, 725 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6affb5073f26..b1330047fd58 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_COMMON_CLK_QCOM) += clk-qcom.o
>  
>  clk-qcom-y += common.o
> +clk-qcom-y += clk-dvfs.o
>  clk-qcom-y += clk-regmap.o
>  clk-qcom-y += clk-alpha-pll.o
>  clk-qcom-y += clk-pll.o
> diff --git a/drivers/clk/qcom/clk-dvfs.c b/drivers/clk/qcom/clk-dvfs.c
> new file mode 100644
> index 000000000000..e6490c4dab94
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-dvfs.c
> @@ -0,0 +1,574 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/device.h>
> +#include <linux/device/bus.h>
> +#include <linux/err.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +
> +#include "clk-dvfs.h"
> +#include "clk-regmap.h"
> +
> +struct qcom_clk_dvfs_vote {
> +	struct list_head node;
> +	unsigned int level;
> +};
> +
> +struct qcom_clk_dvfs_rail_voter {
> +	struct device *dev;
> +	struct device_link *link;
> +	struct notifier_block nb;
> +	/* Serializes the vote list and rail voter state. */
> +	struct mutex lock;
> +	struct list_head votes;
> +	unsigned int last_successful_vote_level;
> +	/*
> +	 * Local conservative floor included in subsequent aggregation after a
> +	 * failed request.
> +	 */
> +	unsigned int safety_floor_level;
> +	bool active;
> +	bool must_contribute;
> +};
> +
> +struct qcom_clk_dvfs_clock {
> +	struct qcom_clk_dvfs_rail_voter *rail_voters;
> +	const struct qcom_clk_dvfs_data *data;
> +	struct qcom_clk_dvfs_vote *votes;
> +	struct clk_regmap *rclk;
> +};
> +
> +struct qcom_clk_dvfs_transition {
> +	struct qcom_clk_dvfs_vote *votes;
> +	size_t num_votes;
> +};
> +
> +struct qcom_clk_dvfs {
> +	struct device *dev;
> +	struct qcom_clk_dvfs_rail_voter *rail_voters;
> +	struct qcom_clk_dvfs_clock *clocks;
> +	size_t num_rail_voters;
> +	size_t num_clocks;
> +};
> +
> +static int qcom_clk_dvfs_find_level(const struct qcom_clk_dvfs_data *data,
> +				unsigned long rate, unsigned int *level)
> +{
> +	for (size_t i = 0; i < data->num_rates; i++) {
> +		/* PLL-derived rates are not Hz-precise. */
> +		if (DIV_ROUND_CLOSEST(rate, 1000) <=
> +		    DIV_ROUND_CLOSEST(data->rates[i].max_rate, 1000)) {
> +			*level = data->rates[i].level;
> +			return 0;
> +		}
> +	}
> +
> +	return -ERANGE;
> +}
> +
> +static unsigned int
> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
> +{
> +	struct qcom_clk_dvfs_vote *vote;
> +	unsigned int level = 0;
> +
> +	list_for_each_entry(vote, &rail_voter->votes, node)
> +		level = max(level, vote->level);
> +
> +	return max(level, rail_voter->safety_floor_level);

I guess you want to avoid having too many voters, but would it be
possible to have one voter per 'signficant' clock and let GenPD itself
aggregate all the votes?

> +}
> +

-- 
With best wishes
Dmitry
