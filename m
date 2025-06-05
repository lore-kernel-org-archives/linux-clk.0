Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBF24B26
	for <linux-clk@vger.kernel.org>; Thu,  5 Jun 2025 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749114721; cv=none; b=Qv0Kfn5WjVzFmg/RJDaIflJ2qdcgH1eG2b3yZYSsD9gdedRj8dBNQ3viwbGIs8fh2K3hcdmU7voiKB3gyeYKnWrOXnjTWAjg9H0wqwl38lrZyKuZPOmzo+j8gtChPT+/odRew7RBehbZi6/URKYKT/ihpg+MsMDR7PfiaaI3N60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749114721; c=relaxed/simple;
	bh=G8kQVo9kZRVl4z1fCLT77N9XWV4CaD4IIzyLf31CqNw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLQi/2xiFpF0mHFZnW8W6p91NYswz55I+jB1jsHkQsyv6MwulPZB5dWznDo26rLfAraroUedkCeaodYLNSoVgNGYV8EGaA6ZMkGWppFwChClKV+U5nlEM8bA+b9dcjLl6VzQFVsJn8mBOkB+k8AnjFWicZcULgQq1k0pOkrnkhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mpjw853b; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mpjw853b"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acacb8743a7so140594966b.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Jun 2025 02:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749114717; x=1749719517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGXviXZa4fv0rKqlJANWxK6jWt62sKeWC9rdavPKx0k=;
        b=Mpjw853bY0PpGki3cB6Pe4tKR3DhSFlZdRH2d3IL06knTdqBK79KmiWxedh8RV9x+k
         ENAynPyctziWtG1EWX2V+7XIseF1afYhHomfg2RpKod/IOMUkTKYAbKpomj/Gca+Svyh
         TpflPEKe6g5ghcO0pwEoDjKwh0zKM4B/Mh8XCpKZxXySPx6b0d3+BXPBRw2ubMAzVC/5
         JJ0kXtttAE8OwCU/DZ02GZPGBqiB0NiqZ0T10GNNMtVpIUkFcGJmZj2d0JgL1LkPKwE1
         zz6ileG97EJxuOV5TcWIoKRNmo2pz2p87bApyx3XK5PvQIJjPiiiINEW16pcuTqA06KS
         kY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749114717; x=1749719517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGXviXZa4fv0rKqlJANWxK6jWt62sKeWC9rdavPKx0k=;
        b=BCMUhdn55k8V+m9sle300Q+M/72ng7i83B8KJOQifzCdq3VdMGzYPezJZM5B/zEkrc
         8+7DkOriGt+YOWpKPgzM+kfzREM4LOGSyv7jMm1/4uIhXUN81ffAoau8HK+3WZR7hapD
         XcFOBHuxP7YwkUMGB00x3ki/JjAsMPMLGfyWauKJXlusMjJsQgveLVk0fpezfRcgqnr2
         prsLm7fJ6FICFpBDgjgXMSZ9YIo3YpL8dgqfokI5i1EFQaofrWLZgwhEFiX3T42FkR2F
         PiknWqrJXSlpwpaXjRmLARqWVxd/1bVerRhLva7aq4hBPsBSNIu7HcH84MSsr0aYu0+Y
         fKDw==
X-Forwarded-Encrypted: i=1; AJvYcCVduJnnNJXn2ccw4SNOtZge+rV73jmdeb8hXNogxJor3svY58lxylOVEB6aew3UXHPyvaxye6VOGNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzutQFWkvc1TL4deo7g6BAjW0xuiNgJ2YRRBixmcxX9SjVBSWvd
	9Ar4MM8DXlE3CZLLcMgIgjis+9OO5d0Ib1uQ2HiD/zqUtnRf/an3aVpM28KOT2VMtTI=
X-Gm-Gg: ASbGnctsvaPm44jGuL/qcnRzl0xwyAzX6ltWX0W1cAh4ydTrbRaPXBGryh5RHhbgW2F
	HkxYtrKz2OAj6zFKUZdXU+YTNLUh1H2tjHMoCYuT+Vo1p+Qcxd7FUQ0QDFTGIagfrKjvBY+jQb6
	PgYBBlJvjek3qHJpYLM7+0+2K9N7p8be6E/zAWDvkElm/SMSfvAsdtFjopZSoLeFlfH/+XFS6W3
	XoIHOp5EXSPATI0uD6sMVsTqTKPbFfdMP7qCRuTWh2DzyZ/ABKrroPekxX2tbgURin8xwjsMp1R
	1SNRz/2u/5I9gP84XQIUE1wKH5jAExkMqkhyF3GMbAwTgjfzEGl8F3dDoxrON53IWaxwTRkePlC
	MNUQQZYXNDYkJeNcJwK6Beg==
X-Google-Smtp-Source: AGHT+IEGrnUt4umUYNEiTeNqeKeV4ar31YaPjgdpxip8tej/ukHXsFFWJmS8AyV6pNbbTkZTC/DHRw==
X-Received: by 2002:a17:907:2d0f:b0:ad8:6dc0:6a8a with SMTP id a640c23a62f3a-ade07635a9dmr240594366b.1.1749114717229;
        Thu, 05 Jun 2025 02:11:57 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3df98sm1225545566b.158.2025.06.05.02.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 02:11:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 5 Jun 2025 11:13:34 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
Message-ID: <aEFfvl7dAANZQuI1@apocalypse>
References: <20250603170058.5e1e1058@canb.auug.org.au>
 <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
 <6e88587d-f426-4841-b370-b46917822212@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e88587d-f426-4841-b370-b46917822212@broadcom.com>

Hi Florian,

On 20:06 Wed 04 Jun     , Florian Fainelli wrote:
> 
> 
> On 6/3/2025 10:01 AM, Randy Dunlap wrote:
> > 
> > 
> > On 6/3/25 12:00 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Please do not add any material destined for v6.17 to you rlinux-next
> > > included branches until after v6.16-rc1 has been released.
> > > 
> > > Changes since 20250530:
> > > 
> > 
> > on i386:
> > 
> > ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
> > clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'
> > 
> > caused by
> > 	/* must sleep 10 pll vco cycles */
> > 	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
> > 
> > 
> 
> Andrea, do you mind fixing this build error for a 32-bit kernel? Thanks!

Sure, I'm on it...

Regards,
Andrea

> -- 
> Florian
> 
