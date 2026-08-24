Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623CC364929
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584820; cv=none; b=fljwgtVxBykrPSty/SIdPguQZ1u2pm6C4Pz9RdnypCaqobyV413wfrbCrAbwnul7S/mEwf21OTpFI/UCicPjsZvoh+JdmGaH6tTZhcbSQR5tMJgMfl1CpK1oHjcArC0enk26r5VSneL3qPdb4dmZW7MaW+zUoh3jtI6nDcmMviA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584820; c=relaxed/simple;
	bh=fW26xNzRxiiLGaMaDgIpohlVSlfHRiHoa+AAfU3wNUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8TkID/Zao7ddhhQRBtgT6SWdJrv7p9hk8/tgKBJBinyMo8DCabA3oZAFl7b9U5tHZcnnU/jCKAWKTmpos8ml7hmW9xU/vzt/ZXJX+4f73LJlMn74cfKre5BJQS9vswtYzsAwEBVVxaap8koHfkfTa0ypYidVqFFHEE1WcWrhUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BmNx8gpM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ja7W31df; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BmNx8gpM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ja7W31df"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i/thhCQwmqZWbgnvAoBPlN/ap50I780TmnPlwXGod7Y=;
	b=BmNx8gpM5BMCSDPS7ewKWLhtkf/CCJccGL57ngQRMhUOXyfKXpWngegA+YQ08OgF1OW6V+
	iMHrr2H0wxeHSAzsU+N8r1iA5IP5zxePkzOa0UbV0PUAnyNt2QTRMY0Od7nCzAk4mV8SA4
	Tf8/XZQilZ1n2fARUjZmZi1zct4DlZk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-xQmQPNtnNZK-gO-YMub7kw-1; Mon, 24 Aug 2026 11:20:15 -0400
X-MC-Unique: xQmQPNtnNZK-gO-YMub7kw-1
X-Mimecast-MFC-AGG-ID: xQmQPNtnNZK-gO-YMub7kw_1787584815
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso297921585a.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584815; x=1788189615; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i/thhCQwmqZWbgnvAoBPlN/ap50I780TmnPlwXGod7Y=;
        b=ja7W31dfEltW3udxdo/bTbGYJX4hlAsR7Bn2PEXhwzMcv+w8ty2Ry5bNjpV27KAltx
         izzFpNLMmoEmuwDINprRaFkUFgUMtivwUhlGn/3+J2xHVoQ2cESoEOLi8xONPWWCcDxL
         ZYiW1mNyvSv6l7rFNAPxiqEJBtU8d7rAg97yCrR9u2NyyIU/KjbrcPTAi7AxS2sB6K2b
         q5lfQ9vpMUeAhvcJjIazVqIAQp4HCtuh0KtZtvOWPX+EgP4Iw/n2AcJ95btPMTPE7YQ1
         tYEpdiskhlyAQxLe0bJ5YsANE8PG9DEq3TQOmrAKaanOPTRe9wHJHk0zmdTYeCw27dJr
         GUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584815; x=1788189615;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/thhCQwmqZWbgnvAoBPlN/ap50I780TmnPlwXGod7Y=;
        b=ntjHajGAnsnEkdMeVXf0pO0aLEEMGDSnd1V6Naist21MQKh1n5323hVR0qInY+djJa
         BeSz0MsRlIdMzN6Gp+lM7Dpo6rRu1iUOJ3n/YI9TpoIflzqPLTWLDZoU2iA+KG/3f7CI
         ZkYtzbfk1G+0mMGLHDeZdECuV+KvUP30to1sXLMHKXoioqb0IPDb0hEdIa5jANJ/UTjs
         485h6lUENOzMDeelQeXZWx6BCNWDUOijeWt10GulFIVtvHTin/sXUDPjp5gtLayVaRbW
         OBiyef3KxZIomO2NOYWd9AP4B6H1HEP+PfgaVGTLTAiMiaE3+RcjUlllspx8cXSUUaqk
         jNIQ==
X-Forwarded-Encrypted: i=1; AHgh+RofhDA5ABM7nTkBICsac5E9KIP9YuQ8TtoIPpPKcMVqHTKYKBy70wehLmiVejwMugtP06LrAty1+0s=@vger.kernel.org
X-Gm-Message-State: AFuF++kxcFjtz2eh2FS6E3/vOX263sRTokj7bNldWohk/e+qvFBFtpyz
	emOez2OV2xYcTz1Mmm4t5YEZtdKBoTyJ8AtgjpC8s36jqFgAL8ZXarZanWTjkRrQ7Jxhqw/reHC
	F7LvX09weyhIkiwFJaU4G1fAlPar1EMqL/JpNpNH8qkjALN7+/nZyPHTnqRBEYg==
X-Gm-Gg: AR+sD10ZpoQtLyBdF1+qL69Ako+Z9MSNctliHsnAR5CBGMFIMORkDVdU0q3zwSRrm/b
	rZVTkgrtOLxvimOPkM4OgGnwYIigddZPgxiYEVPKxGgk56MJtQwgj43+9w67l9P3xQ0O3xvBwus
	XP9TJX3sjZDO5sge6kF+Yv6hE2FyDwchiicxA3v3ttSdG+c1mja4n6yjjqJC3Yh1wxV0ASlM0Dy
	zDHjIYK0nwTYAP72Y4fawVog4fdaL57rBmYCKmhcyTcH2VjcGSwcl/i97XS84lqXeYIjzPbiq8x
	s+GIu+qz+SqAxNDVab9s9M8U1rgvKpEWJKSapQExwI8XtNv774XtQRk0vIAMlg0RYms59ilo01l
	p1bGHcrk8PltwfKj/BdOqTceLkHKS3MirmVg=
X-Received: by 2002:a05:620a:28c1:b0:937:2443:341c with SMTP id af79cd13be357-937469ad942mr1885619585a.41.1787584815194;
        Mon, 24 Aug 2026 08:20:15 -0700 (PDT)
X-Received: by 2002:a05:620a:28c1:b0:937:2443:341c with SMTP id af79cd13be357-937469ad942mr1885610685a.41.1787584814629;
        Mon, 24 Aug 2026 08:20:14 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abe86esm519441585a.4.2026.08.24.08.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:20:14 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:20:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] MIPS: Alchemy: clock: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxhLUxzlLBFyVG_@redhat.com>
References: <3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:05:15PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

