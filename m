Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5B410D37
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817550; cv=none; b=DA1Lqw5edXNDy6KvXdWVtLx4PJ0M2W2PfkTrj4dxDaUz7ckp6WReRkchANOfP8VCXsAp4zdD+s6cUEl144+tYMR5ZisR3Ww3tlPwLFhjvjUfHxniwiItmMpNjfmRu+mGh1EY3pt15qPvWUWc7CMsQcVfA38/gHBe4Nono8JvaII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817550; c=relaxed/simple;
	bh=9e3R1JIz9AoVV75bq5Tsx1/a/1z7ES3mBGeTf8KXXvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jfn+Bl9Cfp3/3/EdnOmYljPeC4/jykrWBt09SLfU5Ooj5GaLlg9NmcjdYqruVmdtFwfjWvhnTd0BYRXRLfJhgOmgfA1H/8Xjye9Ifa3tltpTduuz2WfH94i+BVYp0oJyMK3j1Im1M2PqgAbZIldgL9IXQmDzfkwdeNQWEI1bqYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WwTkPJ0G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FI/O0IW6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WwTkPJ0G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FI/O0IW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779817548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3v7j5t9/Ei/dvkrhTWLvbnWZo0gJn6tOy3Bo7O728j8=;
	b=WwTkPJ0GqlggEnrysvGRcu3rBSYSp7rLgcWxyHYJKSjf2UaTUmhqVYhgTgt7kbm2sBTYEd
	8chDu+L36HcPi9QreajEMvaPaLTVgH+W4qK+kLHOJpFvtNZjSSVa3MHik8/9dTSSanMoIP
	pQVa6qEDk8XMNZKSbxVVdU4Emm0LGlY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-bBAMBAj6N_GNR3EeWb82-A-1; Tue, 26 May 2026 13:45:46 -0400
X-MC-Unique: bBAMBAj6N_GNR3EeWb82-A-1
X-Mimecast-MFC-AGG-ID: bBAMBAj6N_GNR3EeWb82-A_1779817546
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514cbe73d00so296923521cf.1
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 10:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779817546; x=1780422346; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3v7j5t9/Ei/dvkrhTWLvbnWZo0gJn6tOy3Bo7O728j8=;
        b=FI/O0IW6TfiEuUN1O2J//OuGszohr6AYwkFdLtMKowa2GzRZLuWwzy/w9ri3VCHQNL
         ov2ToayJKydiLWpM5jM+5HCUN84/3jKJS44GKegtKtO69V/TaF7YMCJ/u2VmKFBeHaJ3
         wpmKCx5EH81+Bv+iXPqT8BhF/0R1MeiVJR+SWRUStjvP5mNQc942KhhZojmP5igt8tSb
         OfT5K2Rzj9zJWMPVwH0OX1SdvGKCgv3hsKxkJms/hIToQlka/2JaCFXNbmiu6uGsO09I
         eS4AHIhh/016gshywDhToh/IMQWjUmN9PgIdHt2cqYEI8YKUBNVEFyV3lDGy8BFdBvns
         rYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817546; x=1780422346;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3v7j5t9/Ei/dvkrhTWLvbnWZo0gJn6tOy3Bo7O728j8=;
        b=tUTrUpQ1x5Dw9JD/MnrP8fRHBu7MvEbLwa2A4eyDtCty0GWEF9eXymoFwRPixuk1zF
         4Y03w3nuUJ4AQAVcbbzJN7qB5fVzw+8zdgPs1ZTpQbZT1qxGpKNyZosNz9NKvCZ+Drs6
         AqUOXYOYJdh8RO4eM8xKt1KATJu+Huzl+fwHJGryW6Y7dpqww573zC88laSawsas4m04
         MAcYG1IotwpfQMdvxqXFVnR2ywakviMAtABex8L4dg5jszzd3eeTQc3MOts/bdLdb+7B
         PftJ8V2G9NLti80cHT8Lp7adLSRgMeoRHAsgfGvsKagU3MdNc4IFpvSpGsCCopFz5gI1
         3u+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ct4KhCbYu2pNFi5ZwLEeGZTwLrtSmpoVCowLkMFmWdpu8BBQGqDCpUWNZ+3un5YaLF//3HRS6PCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6KzgPiujV2F4MB58eOsXmFDDUHzbf8GnzL64oIgti1YiVxfl6
	R2KvrNCQgRhz7UDDpfpitSdRVdLSP3O6rxl8O39xhbz88SIG+FnrkYtYjA/xLPoKCsfJQDN08PJ
	II4a1zxKg7fXwPwm1iijqrsE+Ns/XntYd5JL7hZBT+C6D3/qmGB0rX8g3X5R+YQ==
X-Gm-Gg: Acq92OFksDzKk2b1lTITx8ezc0Pk6exTRjWsBIWyzWOEvlrgniNS8Nte6U5xOFdyI+F
	p03QTNKl6PTh0LNrwlULoBwDe60oy4QwhuueogUDRpgJiOhlF17cvtVNLYryB5diMuKKRBFKxTc
	LLY2EFSKN4dCxKyA7FPuow1aAGCvQntoXlX8g88EnmAbYtIPnPdsZNwga7S6dH+tBBXCC0DYNeV
	YxZ3RPiyl7zA8mLIKebz+u5zPeWWjo3RLflt548pVcP0ys1sP0jfsKAMJQNzqhd6e83JRIJlDgq
	EXbaa+M1yyEZfvBzw17tlJen9KvpiVN0eu1V2e9xEmKClsM9+JAtpNDAUwPquFm+LLEYs1ZVT6r
	peDp4Zu5fNwdVj3uCx2EriFNxjCfhFIDhjQoyrJNLusSqEFu9dWR+HFoE
X-Received: by 2002:a05:622a:1c10:b0:516:e033:f5a8 with SMTP id d75a77b69052e-516e033f8a8mr202373741cf.59.1779817545799;
        Tue, 26 May 2026 10:45:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1c10:b0:516:e033:f5a8 with SMTP id d75a77b69052e-516e033f8a8mr202373121cf.59.1779817545155;
        Tue, 26 May 2026 10:45:45 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5170c403529sm10457421cf.10.2026.05.26.10.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:45:44 -0700 (PDT)
Date: Tue, 26 May 2026 13:45:43 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	"moderated list:ARM/MOXA ART SOC" <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: moxart: fix refcount leak
Message-ID: <ahXcR-T6pyWmV1_e@redhat.com>
References: <20260520175552.537603-1-grandmaster@al2klimov.de>
 <ag41wJBhdK7-Zynb@redhat.com>
 <cb81262a-5327-41bb-9ef6-9cd91f1be0f7@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb81262a-5327-41bb-9ef6-9cd91f1be0f7@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Alexander,

On Thu, May 21, 2026 at 06:16:38AM +0200, Alexander A. Klimov wrote:
> On 5/21/26 00:29, Brian Masney wrote:
> > On Wed, May 20, 2026 at 07:55:50PM +0200, Alexander A. Klimov wrote:
> > > Every value returned from of_clk_get() is supposed to be cleaned up
> > > via clk_put() once not needed anymore.
> > > The values here are used only for error checking,
> > > but weren't cleaned up until now.
> > > 
> > > Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
> > > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > > ---
> > >   drivers/clk/clk-moxart.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
> > > index 3786a0153ad1..7e191b1481bb 100644
> > > --- a/drivers/clk/clk-moxart.c
> > > +++ b/drivers/clk/clk-moxart.c
> > > @@ -39,6 +39,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
> > >   		pr_err("%pOF: of_clk_get failed\n", node);
> > >   		return;
> > >   	}
> > > +	clk_put(ref_clk);
> > >   	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
> > >   	if (IS_ERR(hw)) {
> > > @@ -83,6 +84,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
> > >   		pr_err("%pOF: of_clk_get failed\n", node);
> > >   		return;
> > >   	}
> > > +	clk_put(pll_clk);
> > 
> > So this immediately drops the reference to the clk after of_clk_get() is
> > called. Can we just remove these two of_clk_get() calls since they don't
> > appear to be used?
> Not if their purpose is to... idk...
> check whether device_node is a clock at all, maybe?

The clk driver already calls of_clk_get_parent_name(), and it validates
the clock-output-names is valid. The of_clk_get() validations in this driver
are redundant, unless I'm missing something.

Brian

