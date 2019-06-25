Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B18C48BD6
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 10:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75E12215EA
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 10:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fBaksqcq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbfFYKeY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 06:34:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47020 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729593AbfFYKeX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 06:34:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PAYFqq013146;
        Tue, 25 Jun 2019 05:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561458855;
        bh=fZaTxdX6cMr4APD67girU2VhKY98+DcMFL2HQdL2v/M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fBaksqcqVH0Tu6N1hxoupL6sdm6CVSb7gQkjgmTYYRyew8asmWMR/PzR9CVaSNNDL
         0t+OnhrvNRz7ak4uvfC5YYn/YT4whKfkW4cV94rsCzJmCaBNvUD8feAka33WfKkBEp
         HucpiUpUc4xFZ+YgTtcKYE6YvEXN8ehMFFtRQpW4=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PAYFKF002868
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Jun 2019 05:34:15 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 25
 Jun 2019 05:33:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 25 Jun 2019 05:33:53 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5PAXqb0014333;
        Tue, 25 Jun 2019 05:33:52 -0500
Subject: Re: [GIT PULL] clk: keystone: changes for 5.3 v2
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <1deb7a85-0859-54f1-950a-33de3a08f9fd@ti.com>
 <20190625011711.3D2D520663@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <2ba035cc-2381-ce36-3b7d-f5027ef9ef40@ti.com>
Date:   Tue, 25 Jun 2019 13:33:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190625011711.3D2D520663@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/06/2019 04:17, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-06-12 04:56:15)
>> Hi Stephen, Mike, Santosh,
>>
>> Here's a 2nd take of the pull request for the clock changes for keystone
>> SoC for 5.3. The only change compared to the v1 is to add the required
>> drivers/firmware change in. This avoids the nasty dependency between the
>> pull requests between the clock driver and firmware driver.
>>
>> -Tero
>>
>> ---
> 
> Thanks. Pulled into clk-next. I guess we should increase the size of the
> number of parents that can exist to be more than a u8? We're close to
> getting there with the new way of specifying clk parents, so maybe we
> should expand it to an unsigned int, but then we may need to optimize
> finding parents when searching through all the parents of a clk.

For now, this is not an issue with TI SoC:s at least, I think we only 
have like 64 parents at max for muxes.

> Also, there isn't any quantification of how much better it is to scan DT
> for all the clks that are used and only register those ones. It would be
> nice to understand how much better it is to do that sort of scan vs.
> just populating all clks at boot time.

I haven't done measurements lately, but it provides pretty drastic 
improvement. On am65x for example, it cuts the scan time from bit more 
than 1 second to couple of hundred milliseconds. I don't have 
measurements for the new j721e SoC, but I would believe the improvement 
is even more with that one.

> It may be useful to make the code
> generic because NXP folks also want to populate clks from DT so maybe we
> should provide this from the core framework somehow to ask providers to
> register a particular clk or not. I haven't thought about it at all, but
> it may come up that we totally rewrite this code in the future to be
> shared outside of the TI clk driver.

It might also be worth thinking whether some sort of lazy clock probe 
would be possible... now we register everything at one go, but would it 
be possible to only register / reparent clocks once they are actually 
requested by some driver?

> 
> FYI: I had to apply this patch on top to make sparse happy.

Ok looks good to me, thanks.

-Tero

> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index b417cef35769..92b77d38dd1f 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -2402,12 +2402,13 @@ devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
>   	if (!res)
>   		return ERR_PTR(-ENOMEM);
>   
> -	res->sets = of_property_count_elems_of_size(dev_of_node(dev), of_prop,
> +	ret = of_property_count_elems_of_size(dev_of_node(dev), of_prop,
>   						    sizeof(u32));
> -	if (res->sets < 0) {
> +	if (ret < 0) {
>   		dev_err(dev, "%s resource type ids not available\n", of_prop);
> -		return ERR_PTR(res->sets);
> +		return ERR_PTR(ret);
>   	}
> +	res->sets = ret;
>   
>   	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
>   				 GFP_KERNEL);
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
