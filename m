Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C321526E173;
	Thu, 23 Apr 2026 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951371; cv=none; b=rESG+4Hx6gQHXOxXEhVpNhrLWlXNQR6eHsV+Ms3l0wnnHk44mRFxY1yX/jzGuzLnbCzR9n2g7Mknw5Dfbha9TsCDKFt0ZMbUz0GKfab2Wsi8xfCEbmlNnWXg3Ic9qpNPshhhasW/FMgCOz2DUc3Ff5Ik1FQ4zkd1ZNxcflEdbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951371; c=relaxed/simple;
	bh=ZFU4l/iBrfXM5tV9OPlIMU+QtKYk/aYRrlUcfs8lPhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPzo/heAyW8FVEgLuu5+Oo+S0uBFiiqAlEFBkInG0UqZcWBPhnCYf0KJ1i2y4WdMbhdc2YfRDrh7lG5a+n/5gUx+U56aFjJXnqkF5CJsrQeiy+ho/eRCQd6Pm014l1m0XP//on6yUSuGGlp4UOFGlnSZ96Z3YoateuBsJlRm8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pz3vvJ4f; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pz3vvJ4f"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7C195C5EF11;
	Thu, 23 Apr 2026 13:36:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1524A60495;
	Thu, 23 Apr 2026 13:36:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E5D710460C18;
	Thu, 23 Apr 2026 15:36:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776951366; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=CjrfipUfn72B1GDWgNgVviWkaBvqYztmuDRubrD3LXo=;
	b=Pz3vvJ4fYEOwzaZmRWnzS9iiPptCFYLxeOEM4jj09xuO22X4TrR7W7xkmjFSAfp7DUpV/W
	GVDKstGvnixc9s754sXiAV2LpV0k/D52xfk9N9xxHWra/ULCGRpJBkYzz0iKIje87/t32A
	1rafq+lFLIttmnjdgBYeyvjWlNoxFfqY2IQB/AbXdpnmLVGFP3xO6E7hQfHQYzvRrj+ncL
	VXk7N8VeVeq8bCxxN1K+HjkGuxQncOBmX9GYjaXApZxtbNjOWhS6qGCP2R+3qt9BI3Ly8x
	uuLmOp45r+7tuxvWd7/wVE4u/t2XwJ/fNGBynh4lgJ+KtlZ4Hxq1rbr0UMekWw==
Message-ID: <7e6eeb33-ca4e-4067-b886-121dbb37a1dc@bootlin.com>
Date: Thu, 23 Apr 2026 15:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: keystone: sci-clk: add restore_context()
 operation
To: Brian Masney <bmasney@redhat.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>
References: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
 <20260407-ti-sci-jacinto-s2r-restore-irq-v5-3-97b28f2d93f9@bootlin.com>
 <adbXBwKC_cNxGlpr@redhat.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <adbXBwKC_cNxGlpr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Brian,

On 4/9/26 12:30 AM, Brian Masney wrote:
> Hi Thomas,
> 
> On Tue, Apr 07, 2026 at 04:25:08PM +0200, Thomas Richard (TI) wrote:
>> Implement the restore_context() operation to restore the clock rate and the
>> clock parent state. The clock rate is saved in sci_clk struct during
>> set_rate() operation. The parent index is saved in sci_clk struct during
>> set_parent() operation. During clock registration, the core retrieves each
>> clock’s parent using get_parent() operation to ensure the internal clock
>> tree reflects the actual hardware state, including any configurations made
>> by the bootloader. So we also save the parent index in get_parent().
>>
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
>> ---
>>  drivers/clk/keystone/sci-clk.c | 42 ++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 34 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
>> index 9d5071223f4c..428050a05de3 100644
>> --- a/drivers/clk/keystone/sci-clk.c
>> +++ b/drivers/clk/keystone/sci-clk.c
>> @@ -47,6 +47,8 @@ struct sci_clk_provider {
>>   * @node:	 Link for handling clocks probed via DT
>>   * @cached_req:	 Cached requested freq for determine rate calls
>>   * @cached_res:	 Cached result freq for determine rate calls
>> + * @parent_id:	 Parent index for this clock
>> + * @rate:	 Clock rate
>>   */
>>  struct sci_clk {
>>  	struct clk_hw hw;
>> @@ -58,6 +60,8 @@ struct sci_clk {
>>  	struct list_head node;
>>  	unsigned long cached_req;
>>  	unsigned long cached_res;
>> +	u8 parent_id;
>> +	unsigned long rate;
>>  };
>>  
>>  #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
>> @@ -210,10 +214,16 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>  			    unsigned long parent_rate)
>>  {
>>  	struct sci_clk *clk = to_sci_clk(hw);
>> +	int ret;
>> +
>> +	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
>> +					   clk->clk_id, rate / 10 * 9, rate,
>> +					   rate / 10 * 11);
>>  
>> -	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
>> -					    clk->clk_id, rate / 10 * 9, rate,
>> -					    rate / 10 * 11);
>> +	if (!ret)
>> +		clk->rate = rate;
>> +
>> +	return ret;
>>  }
> 
> Should the computed rate from sci_clk_recalc_rate() be saved as well?

Yes you're right. As recal_rate() is called for each clock at
registration, I'll be able to restore rate for all configured clocks
including the ones which were configured by the bootloader but not by Linux.

> 
>>  
>>  /**
>> @@ -237,9 +247,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>>  		return 0;
>>  	}
>>  
>> -	parent_id = parent_id - clk->clk_id - 1;
>> +	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
>>  
>> -	return (u8)parent_id;
>> +	return clk->parent_id;
>>  }
>>  
>>  /**
>> @@ -252,12 +262,27 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>>  static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
>>  {
>>  	struct sci_clk *clk = to_sci_clk(hw);
>> +	int ret;
>>  
>>  	clk->cached_req = 0;
>>  
>> -	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
>> -					      clk->clk_id,
>> -					      index + 1 + clk->clk_id);
>> +	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
>> +					     clk->clk_id,
>> +					     index + 1 + clk->clk_id);
>> +	if (!ret)
>> +		clk->parent_id = index;
>> +
>> +	return ret;
>> +}
>> +
>> +static void sci_clk_restore_context(struct clk_hw *hw)
>> +{
>> +	struct sci_clk *clk = to_sci_clk(hw);
>> +
>> +	sci_clk_set_parent(hw, clk->parent_id);
> 
> Are all of these clocks muxes?

Not all.
I will check if the clock has more than one parent before to call
set_parent().

Best Regards,
Thomas
