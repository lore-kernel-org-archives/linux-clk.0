Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62BB2F49FD
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 22:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772921; cv=none; b=UStGHtbBa01NNSucbRsWF737cgNbf6t4pfMRPIEcRy1HEfLWIbppIpDdUCIDeOZT0fEZLNW2QN4fu0AlEv+Mlsht0TWRhIrJ6a7CO0hANMblzmj+LgiVSiHl8psgf2UMsTiDW01X48k0fkE91yK1uRn9bzyzu+1V5RXiFPNNGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772921; c=relaxed/simple;
	bh=ElKwjPTOAtg0/TWBQQSJMch1gOqClmU99IBSdvHdZjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G23+yZCVpcfDXvq00qwlQWG0TNxiqkguV98zitnzoh0W7uReXPN2x1668ZDEzF/X9qMXaZ4j7NNJdzIX1zRC8Pz9oW0Q1jRi6owr8avSnIJdn4SWSGsRNVQcUVVwMl71nLFP3D2X659kllqWQkUHq1JBnlTRYVY4wwAwHm6G37I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aQP8ujWY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+IgASbY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aQP8ujWY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+IgASbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782772918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBhZduBgShz+ZqsIWrd+9cOCiOV8ihQVDuNRU0uLKhg=;
	b=aQP8ujWYzcAyMvuimHhbfIQS3rD+m2yXqOchddABQJ3/7BpnHqA0kOtwl5hLyPWkG4u2TU
	/UHMGJ9C0N+vROCMtEU1++TcDmdPuTe+TgjszJc7lHRhx9/rZHTwEgzC0nG2UNp/7ZcIf1
	vAJthPq/gwQIe554JPYonVkKzNiQy9g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-ECSDfWLnOu6bBWYJYIK9QA-1; Mon, 29 Jun 2026 18:41:57 -0400
X-MC-Unique: ECSDfWLnOu6bBWYJYIK9QA-1
X-Mimecast-MFC-AGG-ID: ECSDfWLnOu6bBWYJYIK9QA_1782772917
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92aea0d801dso608811685a.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 15:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782772917; x=1783377717; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBhZduBgShz+ZqsIWrd+9cOCiOV8ihQVDuNRU0uLKhg=;
        b=F+IgASbYchiwlReISRxrPcbN5hscNPE+1dhtvFRdIppLufPeQbNiP2sFDaPyLwvu3i
         KCUzoYvPVewZfoHRAASxLSgS+uPteIgt9tIeb8YLc0ck+Hru9CZ732ySH9d3Cm/q1COn
         3hOYZtseSJVKT6tcvCkRQHr1KbV1gnoLpPGZ7Cgr4qFofm8mhBkINeaSDH3jT3veUx0K
         9GwHAJN95qrh3Fr3MW13IBDhI3eOcEkejR/FFhRveWB8657rs9WTkBh3B4p4BoYsXegR
         vlsll1MhQ9Kp9JjKGpUySKKop9Bw6sIuMrswiuXHWRYVoTORhCxoB7plseo6/jGazdTz
         9MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782772917; x=1783377717;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBhZduBgShz+ZqsIWrd+9cOCiOV8ihQVDuNRU0uLKhg=;
        b=JvlVCLmcRoG7g4R5yOOsOzPu2XaKSZoPEYBmlXrs7lYw47p+aU4LUrP/BUXYtdv6ea
         lZdpLgbTlWWUVCa70vxxrqbi41HP/ENVxxhLXGWbO3pFBfCCnpKzztgrCkrWbwCkZpmm
         42NcxdGPZPEUVWBDxAo5l8LzXmYcYzwkgabz8gD9JWWkI7r8+hfnONK+JZlmw6AhDxQY
         Ff3iF/bFWiEKwc9tmeiJFNEYvkTiWKhPR4PUtfigeIV24T3TgyWU1a+S2ndPcdG6fqmm
         RyswEb7lry0n7Zw3+/zE/URh5r/saCmBT4bR33uI6EUC5IH3OJQcjfMZ7T1Y55+jp0aX
         0KxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5gkTzrXnKiV/wqvsDaqFDuCrTPdFKzys3zeG1uc4StfY0cbyAizlMN0HOkh3FF+0+yDDPAi3f0sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGRHkxtQndec+fu5HX1pu9UiBRmxMUbovY+UlCg0rBFy7M7ksZ
	p5GbcmtRkpS2xIaLOkaIdym0CYJZQot2gvuKuJQadC11r2wdR6ma/eI0y/Ya3qoW2MI5pzyJQRR
	duMZboaz26I0aYWOhi03etA06m2d5rJVWTtUFU133X02YFUs8FeDH2Re0aB3bIQ==
X-Gm-Gg: AfdE7cn+rEpM2J88lvYHh6JY4s4EsKWEOWLUy4Lv48vzUNC5uUYKpIKi69dOFx1bJ8N
	jR/kfe5Hl6SQd0C+wzWU8jghY/TQw58eyJ4N7FiD25F/Xr4mRUN5wby7ovLI1O0u70l9KZ/j9+3
	5vNIrUb48OjTgpmuE5n3pEFvRBTK3W5/crM1Y3sZ+twh1X4TsqfX/p011dykA5bsT8jzOc6VFex
	NH8Jiyg4UDkqz/fqW5tdap3RJbb5YeQRNeMFXgdGoTSADrlEjLznrI+wK/iWfba3qBzQ8bm0KFU
	NOj/kgQxsIoQ73r8b2y6affxM/T9BfSpQA1nErkhnU51TiIi2FtGbLshUx8b+eb8wkj2PqE5Wdb
	FBM+AXg==
X-Received: by 2002:ac8:6104:0:b0:51b:eae8:4fe3 with SMTP id d75a77b69052e-51c108a85dcmr18474501cf.55.1782772916719;
        Mon, 29 Jun 2026 15:41:56 -0700 (PDT)
X-Received: by 2002:ac8:6104:0:b0:51b:eae8:4fe3 with SMTP id d75a77b69052e-51c108a85dcmr18474191cf.55.1782772916207;
        Mon, 29 Jun 2026 15:41:56 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a2db7ad7sm8727716d6.11.2026.06.29.15.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 15:41:55 -0700 (PDT)
Date: Mon, 29 Jun 2026 18:41:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk changes for the merge window
Message-ID: <akL0sjQVQbqQYnDF@redhat.com>
References: <20260625151438.8471-1-sboyd@kernel.org>
 <aj1NUYRrD30ctAbt@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aj1NUYRrD30ctAbt@redhat.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Thu, Jun 25, 2026 at 11:46:25AM -0400, Brian Masney wrote:
> On Thu, Jun 25, 2026 at 08:14:37AM -0700, Stephen Boyd wrote:
> > The following changes since commit 2abdc3dcf9780d070e55a99fdf8f93440c798b84:
> > 
> >   dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6 (2026-05-15 11:26:26 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus
> > 
> > for you to fetch changes up to 92010229c4b38897f1319d260162d2f96925ed17:
> > 
> >   Merge branches 'clk-microchip' and 'clk-qcom' into clk-next (2026-06-25 07:55:47 -0700)
> > 
> > ----------------------------------------------------------------
> > This is all clk driver updates. Mostly new SoC support for
> > various Qualcomm chips and Canaan K230. Otherwise there's
> > non-critical fixes and updates to clk data such as adding missing
> > clks to existing drivers or marking clks critical. Nothing looks
> > especially exciting.
> > 
> > ----------------------------------------------------------------
> 
> Would it be possible to also include Benoît's support for the Mobileye EyeQ7H
> SoC? He has a pull ready:
> 
> https://lore.kernel.org/linux-clk/h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com/
> 
> This also wasn't picked up during the last merge window. We push vendors to
> upstream their code, and they point to situations like this when they tell
> us it's too hard to upstream their code.
> 
> It looks like this was mostly pulls from the subsystems under clk. There's
> also a bunch of patch sets that I reviewed this development cycle that I feel
> should have been picked up. I'll send you a pull for that.

Just to close out this thread: I sent a pull for the v7.3 merge window
for patch sets that weren't picked up for the v7.2 merge window. There's
patch sets from 19 different contributors in this pull.

https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/T/#u

Brian

