Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4746837BE7E
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768238843; cv=none; b=C2T31iJRVTliAjB4+K3zouPIkwv83vodckd+IBLzjaYtYwN0x42b8l2u7KFjrbKSK8nNrIceWy/7kq5OSK3gR7L5kR2mSbC3XKBwmP6S17uyRXKJQDwuC8ix5DSxgEU7aXH38Y/EK3uImkuLJ4yf+zUdfS+fDLWJFO7oAM+UnyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768238843; c=relaxed/simple;
	bh=zqidXFk9f2QgplgqJW4bJGmyGdzzOuzyoAcWFCGvl+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZVYu75w1H2oc0Kd8UzgeKu2o5RePCJkg0SmfEv6eqgV/bMOyXeBLAVkctyntAYlAhpX/qGthYIxDSTpptG1O1Cm6fbiNj0Sc9vMI9QEm2haWGdSMseLjnHdO3UU2hThJ0P9VD/2vcffJqbLW/aPWvn+VFfZ8SW6ucPnHSV0X5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uuyh+y5a; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SzYKK3Ll; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uuyh+y5a";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SzYKK3Ll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768238841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o9CPhRuZpJq6EBnHnbZTvPY3sZ/mCOvqRmxNXxppx+A=;
	b=Uuyh+y5aQgaD5cldSSWKaVIlNnketgrUwrp9oYv+KLwRTvtHJb7HDyGFfxaTaNA8SDLEMz
	QEckXu7QI7ZlC0zhSmCjHzSZEgjazbO6ILk95PagW/eTXILaeIzO/vVt7AE+GKNLiRwJv8
	m0tvy3FKKtA1DnWGgGOOfAWCFHlDbvk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-352umxUFNa-AnJYXghWl0g-1; Mon, 12 Jan 2026 12:27:20 -0500
X-MC-Unique: 352umxUFNa-AnJYXghWl0g-1
X-Mimecast-MFC-AGG-ID: 352umxUFNa-AnJYXghWl0g_1768238839
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a316ddbacso174801966d6.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 09:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768238839; x=1768843639; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9CPhRuZpJq6EBnHnbZTvPY3sZ/mCOvqRmxNXxppx+A=;
        b=SzYKK3Ll+oB+S7sj9qt8rTgIvezqQfclopL5xsg6ZO2l46eAhnVSDPfYDcHq0ki3Xz
         N8heMoED1qCPE+BRlqyB+zhNg0tvtTLuZcqvsM+N3VcFyBLVSdSA8cLLa9hhICtV3Yd8
         HbwjSbAovIvTMBWVYS74lWz1FcCPYBIJl1h5mpQbKebV08VSukuSxYgBxwWkbkxJgrD7
         vXB72gzkDD+6/0+arL9cNV066r8jyoQO5rKb+vhgkczE950tqx4ccn3zvqz0oa2pjfWC
         Rb4cIx9eYJYP6YQx5fIxi76DcRjhubEA9cwE/VnOW1Md98Mc9uQF27E8vZp61wcY9UiC
         bEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768238839; x=1768843639;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o9CPhRuZpJq6EBnHnbZTvPY3sZ/mCOvqRmxNXxppx+A=;
        b=nY7qRUbgJr+fP5owoORRyhzqdeZU3yqwcGA4acp4bRPBIBxKVBEYAsY7IATKotkf/c
         wkHI55ONlDUbFs5Lw6JovkohbUcy3LQGjr+Q2tpwzUpAN0+AQ0d8e93qWYMIM6DPpOR5
         c3vQqbyS8sWcG5x3JfVllqBUGraIqrzIVhgQ4DrTusH7KQfZ53F8OTXO0R4nTH0dLjxv
         5XMzuJNn2XRWYIaja9vTGp/ZyxaZSZKzlN0e53JvR9B1vQ1qbpF5QwOwijkCf6SXnt6X
         ogp1BWBZbtUACX55bErWjWa+0VtQYpIDePPiaWARu8o9AUjCPLCFl0CDD0DvvyBfSxYe
         IHFw==
X-Forwarded-Encrypted: i=1; AJvYcCWfvaMaiG1eQ07NL0p5L0QVWFk2abOAhwfNPjDVRNV1oTfaJoKh46HjHDycNnHmcoOBDe5cBEQSQmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi/FDcnmfKlLJY2nwwwwKWDp2pc2URy+daa4xxWL2adye2Styz
	1DuXZFQHNOE+C8KaCKE2LyC3bb+FMtRtdzeAzQya7WNP7Ij02NQ7r3Q0sYTDZfPn3m/0RqezaBL
	7GlZZY5c/cIrdhfWjybFWCUy8fQnL6Jm+4ZmRk+Z3THaZ6xsBW3lQ9S8O2DCkqg==
X-Gm-Gg: AY/fxX5kw1PECq4ygb37XpfdRu+NneGqdSYbTJwFZmKlZqLMeK5PpovfyFphKtpuner
	VQsinCjvxcjMAkpm0OwM9rZVU5yFFGA2prBlaMnHyQtlZKuQoW4Jk1g2PkLVkG8ym+itJkcIg0b
	oqD1bzztRQWbBqDo1JcaN+0qG3uTJ10dN5TLIV2yKzLO8YQ/6miCtwJtMLDXWBukEyGbyMvFal/
	b04ccqiPgjBTxo0K0+udjJvyZ4TecGDSjSeQrCKvessUx3Bq54s23GTlWrgq3BZDVVYifKHjgTG
	D7e68yQk1rUoq2XoM37knTsqtEOnlhBw8Q5MwjpY1o7gU9HX5HVhhkD1ghm78oTHm3t1/er/Et3
	rJGyNxvQd7hiLInBVpe+c0tQ/6jLG35GglBioqVSeU41h
X-Received: by 2002:a05:6214:418f:b0:890:7f0b:4108 with SMTP id 6a1803df08f44-890841b3de6mr262089136d6.25.1768238839247;
        Mon, 12 Jan 2026 09:27:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcDf8b74yP0hUcevb1eT+9bn/MVv1cxFiKn/dxo6t7uQKIDUmb5d2bfYkDmpZFnwIhQzntDw==
X-Received: by 2002:a05:6214:418f:b0:890:7f0b:4108 with SMTP id 6a1803df08f44-890841b3de6mr262088856d6.25.1768238838754;
        Mon, 12 Jan 2026 09:27:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm148766176d6.48.2026.01.12.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:27:17 -0800 (PST)
Date: Mon, 12 Jan 2026 12:27:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev
Subject: Re: [PATCH 17/27] clk: sophgo: sg2042-clkgen: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <aWUu9JmPDgrJ5VxA@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-17-535a3ed73bf3@redhat.com>
 <MA5PR01MB1250095A65211598BF17058E5FE81A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA5PR01MB1250095A65211598BF17058E5FE81A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Chen,

On Mon, Jan 12, 2026 at 10:57:17AM +0800, Chen Wang wrote:
> 
> On 1/9/2026 5:16 AM, Brian Masney wrote:
> > The divider_round_rate() function is now deprecated, so let's migrate
> > to divider_determine_rate() instead so that this deprecated API can be
> > removed.
> > 
> > Note that when the main function itself was migrated to use
> > determine_rate, this was mistakenly converted to:
> > 
> >      req->rate = divider_round_rate(...)
> > 
> > This is invalid in the case when an error occurs since it can set the
> > rate to a negative value.
> > 
> > Note that this commit also removes a debugging message that's not really
> > needed.
> > 
> > Fixes: 9a3b6993613d ("clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()")
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > ---
> > To: Chen Wang <unicorn_wang@outlook.com>
> > To: Inochi Amaoto <inochiama@gmail.com>
> > Cc: sophgo@lists.linux.dev
> > ---
> >   drivers/clk/sophgo/clk-sg2042-clkgen.c | 15 +++++----------
> >   1 file changed, 5 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > index 683661b71787c9e5428b168502f6fbb30ea9f7da..9725ac4e050a4e6afd3fd50241fbd2fc105a31ca 100644
> > --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > @@ -180,7 +180,6 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> >   					     struct clk_rate_request *req)
> >   {
> >   	struct sg2042_divider_clock *divider = to_sg2042_clk_divider(hw);
> > -	unsigned long ret_rate;
> >   	u32 bestdiv;
> >   	/* if read only, just return current value */
> > @@ -191,17 +190,13 @@ static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> >   			bestdiv = readl(divider->reg) >> divider->shift;
> >   			bestdiv &= clk_div_mask(divider->width);
> >   		}
> > -		ret_rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
> > -	} else {
> > -		ret_rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, NULL,
> > -					      divider->width, divider->div_flags);
> > -	}
> > +		req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, bestdiv);
> > -	pr_debug("--> %s: divider_round_rate: val = %ld\n",
> > -		 clk_hw_get_name(hw), ret_rate);
> > -	req->rate = ret_rate;
> > +		return 0;
> > +	}
> > -	return 0;
> > +	return divider_determine_rate(hw, req, NULL, divider->width,
> > +				      divider->div_flags);
> >   }
> >   static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
> Tested-by: Chen Wang <unicorn_wang@outlook.com>
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> 
> BTW: I have a question about the base-commit on which your patch series is
> based. Could you please tell me where I can find this base-commit? I'm
> asking this because I found that for the changes in [25/27] phy-j721e-wiz,
> if I'm based on the latest upstream master, I can't successfully apply this
> patch.
> 
> So, in my testing, I'm based on 6.19-rc1 and haven't picked [25/27].

My branch is based on linux-next-20260105. I verified that this series
also applies to linux-next-20260109. The TI patch depends on patch 9
from this series that's in linux-next:

https://lore.kernel.org/linux-phy/176656156358.817806.16966474957670370356.b4-ty@kernel.org/

Brian

