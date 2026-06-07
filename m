Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17C01FE47B
	for <linux-clk@vger.kernel.org>; Sun,  7 Jun 2026 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780807400; cv=none; b=hAgyCcw8PFvWEJ5m51Z3+pe8nQc4wA2p9zd+9hntltKcUTTSy6a2pqs/AqrMVa/FZ2ramUX40gem2W1pHYZ8fpTrDYvrKj247dl8vUhP8SMoVtOePq/TV2XAmoXbBZrru7g9cdCD/C5SqHbbNDm2hBW/cnmwtDsumjIAf4r+Pu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780807400; c=relaxed/simple;
	bh=Dd9Jrs9HlP7jZkQXx3mkWpkdTCHX2H4RXixCJvaWed8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/EGqirn0PrWawhgZRGMnkRdq6ABpDa3g1+/Hq6/ngBKPVMmXjZFa+wkeDpBj+oK6/xOrn/ObTzZB24M8FfCwkgjSIojK/L0KQZi1+rEZvJsvfZUhfM7PVWaiuGPM4Agd/IGJtBPAVGY05coGxQjgj+G864M2OQAWuW21RUwnfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=bSk7wk1X; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="bSk7wk1X"
Message-ID: <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780807394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7joSm0+uHvv2hAYIoyujknuutXHNZcAC8aA6ciTS3Pw=;
	b=bSk7wk1XQkNAGQS5xfIVD6KD97lK+TDYwZFkcvMaQJ8fIYR/M478GG8zX0a6cdGocG6XPq
	6EJdcuIiLtKtkGLGMuJpKUtl2y2hnTNMWIMuJU7qt9qsWRVJCPjI3eo948x7NP1yeROr+w
	uuUiDcuD4fzHTVjyXKh6o0J2R4VTjNb4TLUZwYZlqUrVtNulDa6XHyFm6xfqpW0fmgeeno
	L83bhyPH4YjLgP6LziKuLVl4BwADxArL191Yfd0DsEZZAL1T88FZJvvp8pVx8FmhU6K4p/
	JqAapF+fQDCbnhDvgU2MzuegJEmhtAm7/R2rJo6zfl0KaIJqPwqpjTOveb1Gpw==
Date: Sun, 7 Jun 2026 01:43:06 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
>> Several qcom clk providers currently have a sync_state helper set to
>> icc_sync_state(). With an upcoming change to the clk framework, if
>> sync_state is not defined for the device, then the clk framework sets it
>> to clk_sync_state().
>> [..]
>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>>   
>> +void qcom_cc_sync_state(struct device *dev)
>> +{
>> +	icc_sync_state(dev);
> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> internals. You might need to set drvdata to desc.

Hmm…

Currently icc_sync_state does not seem to use the dev argument at all.

How would something get messed up, now or whenever icc_sync_state 
changes? o.0


Thanks,
~val

