Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715ED362133
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584533; cv=none; b=PJcWlfkdmQUKpa7kxrueUxxGuPGk9WFjsMwy3CKbb6Uj+Fo41u2HGFqa23zB5C8yTuP7oKqocLQA8Rzm6jlBXiE0XyNh0dsbQaGdOJ4+vQYvsIkaGk8wT2lJ0QcBNyjxbzdPxdrZXmX2TgiZhrWRWZ7LMnUTvJeGmmNU9bgGSkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584533; c=relaxed/simple;
	bh=rOXrxHiKVwq62hDB+l5Iaw/LvrpFfNRsCnnE/WH3O80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwrXULQmJVkai4urI1YdRzhySV2+l6rQlNJ321CxxmO3T7v2rT3yfQCFrs7TlmoMG8suBKbZnZVPGjwmPy5wB/zN9aLtKVknz6EMTVXmvGjY8Vm69wkUtVbvOJiEXUPWIrICpaI1+i6bmwFloJYjqMvoMAXZVRzhYVlm//ngebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHonTQKe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A8Hg963i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHonTQKe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A8Hg963i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QomLv2Wl9amQb+LBn6L44LQaCfrla4njzarG+GnuCsI=;
	b=OHonTQKe2KAZony1/34W0BoerHadscdyBQdDvY3PeyAyditbL2wC0+jJ2A8tC/3PqNuhEo
	dZHE1Cu9v7W56f/nH34Mo3pItDvGZ+KsUsRrXwZ+OvPOn2CN4D1XjJwEmPLj93eh2Dhl/g
	61CK542WV99hw14Llyibbz+vZ97hu20=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-wD0nw5RGMreu9Xj1oweq2g-1; Mon, 24 Aug 2026 11:15:28 -0400
X-MC-Unique: wD0nw5RGMreu9Xj1oweq2g-1
X-Mimecast-MFC-AGG-ID: wD0nw5RGMreu9Xj1oweq2g_1787584528
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b571432fso336874485a.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584527; x=1788189327; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QomLv2Wl9amQb+LBn6L44LQaCfrla4njzarG+GnuCsI=;
        b=A8Hg963iGacQePJorwk5vCtwgSGafSbciXoEcHB9792nIYoBKqmv3PTlopJatUCF2g
         1Xyadtulfy0YGfUL60lBSRnpRFDCgpWNw2LnhUE1xnKCPbaoh61BO8OF9lHT4G9ErdWr
         Vp2ZYVZIde3Q6F/ElfJ7ZVQwN+RJg8uWbQOwzDiq1efyjA6Y+YJ/0aL/nWq3jr7ODoih
         OsSZYGTx/NxWRTFJ26/1gtUQdwxpcOzx5fDMmyjJxo5qyVsWn8oRAyQnfStiFOUCQ4Hb
         KjljE1zs+wRP6HNFO8i3gO4jIEX2tMhVNO5ZbED/NPH8gLHgquLdIMP12BRBTW0Wr44u
         H01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584527; x=1788189327;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QomLv2Wl9amQb+LBn6L44LQaCfrla4njzarG+GnuCsI=;
        b=BqdXC9BEwgpyFYLPvggF+Dll74347UCCM/13De5anEBx7iDYM9XUL/vClXvrlkxIXn
         i7faZNuRrmZJnC3ilscUnUoLog7XMNp7Ky35TqUUcrnBNQZvvWmSiSuK+ceLZrRP+MWa
         L9kxHXGERIcLpMTrun0g6+5gToRb2E9dJBe3jlrR/zbxAZdsTU+egUAqrKMCsUrG1YBE
         CapZBx9+SH/XaGn64BXmhrzfLPWihWZlJqKCG2xVAoxUT6Bl6GHu6+VWDRHP1g5MYgSN
         cqk7S69huYK2gEEuWi+JZLqzre6PllLjREDDKInCBxKclyYSJGcwdlJakju1Lg9zhOFd
         4ImQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6rUT4bMb3zqfsiVIykXpCpb8ADYYYgF44BUuzh6xK4NG043lv5fUtEJ1bKUIvNZmBIRdU4M8KTYI=@vger.kernel.org
X-Gm-Message-State: AFuF++lugpQKrhuYgTBrTVR+h2G6gowoUR3R4SWM6qCqLs9c7vqfOMT2
	s7kWLkdExuaSRfPPvZh4Ge1lYKMhJLyZWopfm567ZQ4JtYPNtCFd8JzwNk4wz1Q59I8uVBNlU7S
	LQAvCDzqZO4xfjmoddP+VZOWUGVwFYiG4kBKkmqC+rgxFo+Byu4GO+jubnwNduQ==
X-Gm-Gg: AR+sD12Qe+WfEHDrR9HY+3TqzsFb2H6vx93rok8NoiRqhSc7yf7+GdPCYdEhPNKGgEz
	UD3lRpyRDc38TjiDqUxdwdh5DeINsTYD+2SrlZa9pywDAESmR8B5ZbCVTcxOMmMfcLu4b/0NhoB
	IanYlx7AbqXVMLBNiIvodu8s3YSi92L/ro5kZhUgMnsZ1niAOF1lfTyNydyXBNkltCJjmCDxoHu
	pbsDS/eAKpa5pox7I7xGptxPsAKjMuJajmW7MpqX/1RLNrreAxlfS4yCEoYgTqwlsshmEBcNLqM
	gtBpseMo/duwdVsjTAv1MUD5jaWd65/rFwcsVhYNxNGmRZSkt4B8fyWIX8fpzEcrbbeFhjjB6NE
	CINVI/z8Ar+KiexNP2m1Wxtlm5imwSAiwWS4=
X-Received: by 2002:a05:620a:4594:b0:936:9f49:69ca with SMTP id af79cd13be357-937398e83c9mr2267627385a.21.1787584527671;
        Mon, 24 Aug 2026 08:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4594:b0:936:9f49:69ca with SMTP id af79cd13be357-937398e83c9mr2267611385a.21.1787584526743;
        Mon, 24 Aug 2026 08:15:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749e9f956sm515969885a.36.2026.08.24.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:26 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: tlv320aic32x4: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxgDA7ZR6aoy9Fo@redhat.com>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 10:52:57AM +0200, Geert Uytterhoeven wrote:
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

