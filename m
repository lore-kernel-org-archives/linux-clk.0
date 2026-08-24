Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C720400E0C
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585083; cv=none; b=hI18sG9PaBsB4U76/zj2uRBZf9zM4QkU4FE9QULMzbEv1Pe+0ErdRV7dlZsh/YD+reCNkkDNdQI8444duAFe/swzamyKvwLTD2n6LKAtr4UR05DMAe57xSS1FQZovffU46mfoWAEdFnUZjXU35v1ek4drw6/ZvQb+DSwwyzMK9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585083; c=relaxed/simple;
	bh=Nz42ld06ZmUMKxPkpK7pbX5ItyujKNMQPU25WEZj9Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6xORT8rsSQvLoGzsLysR9oOT3FqfSI/VhEXUkBQqD/XHewd6R88EMA1rVKf+/NMPCewwR915sfJm70AN4K5QYtzjiXABxZP/GXPrhpFPQUubOS0hrIdnZJTMUtmeyG0wrU1Tses9OLyDL5OZIEtySSbQUK6WHsh4r/KunOfSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBUNrFBS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LeD5HDQR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBUNrFBS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LeD5HDQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787585079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6uhUYk0fm9prQbHJW3arjOgDFYSVu5qZ/5zgxqVB10=;
	b=aBUNrFBS6AXK9zwLIE8gM/gBx965+g0XQ6TWfJ9xsuEHMNDMRPm2s0DIqhCOd1AbY/BZX9
	EWvCFof9nQMSVzzRB3oAGtpScOyz3B/FQOWzt8msvDenTA7a9txDPGl6G6jbu5r639Sk9x
	2OX4Usju1BGOT0Fd92fhX/hVJawEyVw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-PwyKW2FEP068H-MI8KK8dg-1; Mon, 24 Aug 2026 11:24:38 -0400
X-MC-Unique: PwyKW2FEP068H-MI8KK8dg-1
X-Mimecast-MFC-AGG-ID: PwyKW2FEP068H-MI8KK8dg_1787585078
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so356645185a.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787585078; x=1788189878; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T6uhUYk0fm9prQbHJW3arjOgDFYSVu5qZ/5zgxqVB10=;
        b=LeD5HDQRGih9ybQggndLq4spqS3WAx2S9HnP0jEOH74m06Bc6PRxMeJxZvzKiBpj7S
         Zp5+RAwAMW8JNFyEkFSp6JNA4ti2mFnRXL20DJYBzy3ebXlH5MhrfpgeKX/3NPoVS2AW
         +LvkoDYV1YPOZcOuzG6E9c1uSMWyycD/Od5Kk0kXqQiFd0W95ayZbVDH670vJP8dkZi9
         MHyK3xRydlyFRdJ2vwi8vcbEzfm0zRx0P+hm/il3vrnG/yo2gT8XDV02YlFtCD2tQ4Tj
         6jtphE9gTufvvZgZcgcsSkM7MkCMN4Bhx4LEx98ySkc8kK2pyLHmRjZYuJH5UwM+JJsS
         yz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585078; x=1788189878;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6uhUYk0fm9prQbHJW3arjOgDFYSVu5qZ/5zgxqVB10=;
        b=NEO4wtTyCmuw7LUh7IIAjtolzozNi7OhW14PMoE5lNFe/orz8B60iPUaU6Xljbp4d+
         6Fmw1TZx+qwoy9pcDgsAWzMqJRNTzg4h63ypzXFQ7588vcsoXoPy6ds0wDOxKOFP7fcG
         sGKjPirILEA5WGuV/4Yef1qpK0X3PQbpDtOkkN44UOQZ7/V8myntXjfUbn8U68SxGLvP
         SkkWCf4FkEdrUeW9e4/Tf1S/v4tM08VAMx5nv8mbQM0Sm90wFCaA63JROZCzf3NtlHwf
         jOjOzjHdd6d/aF46KdJJte4PvWwHlw4NmnfIJcMpQlwBFjIszGXYyzJzhLmUzLwu+VP/
         dCdg==
X-Forwarded-Encrypted: i=1; AHgh+RrIxF1eVztQ2Ei1W7ulkK+ng+KiOeIGmddkgH6HZyx6rOzHjRsJFISlatV0oKzM3a98Sbm1sFkJ/wM=@vger.kernel.org
X-Gm-Message-State: AFuF++lU+PMoe1rbmyuR0nJH226jDcJSKGtGLsPQ7KCOjJoFU0aYvrRc
	CQLPxN4dB4OlDM/ERgZBDJiIePQA0koK5dEUmds+t/dQFRWbYBgZc3oreKEa+HMb9GhkFQpCLej
	76SlXxl/3+S+0b2FjOLtJqKkXGLcyQGebIUVCC9ePaLEmbjQ2vlzcHKxp2KJSGA==
X-Gm-Gg: AR+sD11QbeZkTp3NvGRIqkxsIW0D2YHfthDmLdiSq+KEdw0cL73bjvkmKsjLsDf8SFR
	Dw53h+ywnpwifFvfOXgJXp53vU7H2aA7ygWR2whB/WzT4QRpeSLqQbVFgVInqFoFGyhiS62746q
	je8BxKUHDQDFq12jpMvR0WMmfRApSLt1KAUAhVHCiP7i/e8rRWarfsaK0/I7PE11QIBY5r99m6j
	ad19EHXOnOZmaieeeHkWFco5tgxUlMTBkHzaZhlgVky+SPUUcPf2NRrewqK17a5zba8xlPt9crC
	BlBTT8uJBVyKYeH13eJSyMtIZ/mJ7GPR8yFfsz+jGc4kWPeSBPJmZ/ouDmBj8phTM+ljqRQCkgi
	aqi1LLhMnWCQmETQVx/gb+nb6NAlV9+dRIOE=
X-Received: by 2002:a05:620a:4148:b0:92e:7cc9:a888 with SMTP id af79cd13be357-9373942e4b0mr2548674485a.2.1787585077801;
        Mon, 24 Aug 2026 08:24:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4148:b0:92e:7cc9:a888 with SMTP id af79cd13be357-9373942e4b0mr2548668185a.2.1787585077349;
        Mon, 24 Aug 2026 08:24:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749eb15f4sm522227985a.42.2026.08.24.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:24:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:24:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, linux-rtc@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/5] rtc: Make sure clk_init_data is fully initialized
Message-ID: <aoxiM3te751QfPJn@redhat.com>
References: <cover.1787241693.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787241693.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:09:01PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the RTC subpart of Part Two, which fixes remaining cases
> that are currently harmless.  These are still fragile, and may cause
> future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>

