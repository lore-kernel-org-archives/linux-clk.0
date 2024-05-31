Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882F1422CB
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717154210; cv=none; b=ONGsWesUGO7Ks5MhHHibmikCvbdeONoQ3u9Zit4kUObBL9UyAp4NB076OXSsiwQeIJp0g2Wk/aUgVCO2cxyA8q/Azqk1ejvs4Av+SuOhsxhf1xKVbAbWmiTMYZ0/z2VjQbzNIe5CEb09lpulU6TpUf+4bYz4IWa9J575j42/Gm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717154210; c=relaxed/simple;
	bh=BZ6JOMSOIAZzr36aepwVwk5kPFU8MRrt4lY7DICudrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHTZp7Ec+Duhlo8TGjce0j1npt2Ri3B5duYjPtVmEcNtXKuVO61v3nJnqnGvYWvumacqkqJZbZuUntvbuAN580ZEdo1qmMGUf6x5cDDh5v65zP3HOPHw3aqeB4u0TTVwRZlhjrgf/96GV0Q0a0MKX5SGG9916rlMXgT5HtTDI0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WvdvFX5P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3JmPESsD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WvdvFX5P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3JmPESsD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WvdvFX5P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JmPESsD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WvdvFX5P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JmPESsD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4198D1F84E;
	Fri, 31 May 2024 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717154201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yPYT59+DxYsKsUypnYSGpK/zqH8YT2Ko/ExElvL7j+Q=;
	b=WvdvFX5PjQIsU1B8eX3EVYr9zu9VPZ/Q101iEjK9Gw/8QxEiw0Kns7KbQ+1+BRzZniZAdn
	aSBbGus5N21k0peQnSZ7Bsdo1gFoZaOZiWMyvOzRrdREhCAeuqO3qC5U2CmoHR8otBTSdY
	CEJ+ecZyySlUJO8goJQEM3PXsaabro0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717154201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yPYT59+DxYsKsUypnYSGpK/zqH8YT2Ko/ExElvL7j+Q=;
	b=3JmPESsDksFkqUuIhciwxyC2XjPK3KdtemOKlI3AdavXIs9+2Ik7GiDsEcESg1dvrzw+rZ
	mtGuQz1OzZZK5ADA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717154201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yPYT59+DxYsKsUypnYSGpK/zqH8YT2Ko/ExElvL7j+Q=;
	b=WvdvFX5PjQIsU1B8eX3EVYr9zu9VPZ/Q101iEjK9Gw/8QxEiw0Kns7KbQ+1+BRzZniZAdn
	aSBbGus5N21k0peQnSZ7Bsdo1gFoZaOZiWMyvOzRrdREhCAeuqO3qC5U2CmoHR8otBTSdY
	CEJ+ecZyySlUJO8goJQEM3PXsaabro0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717154201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yPYT59+DxYsKsUypnYSGpK/zqH8YT2Ko/ExElvL7j+Q=;
	b=3JmPESsDksFkqUuIhciwxyC2XjPK3KdtemOKlI3AdavXIs9+2Ik7GiDsEcESg1dvrzw+rZ
	mtGuQz1OzZZK5ADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 266B5132C2;
	Fri, 31 May 2024 11:16:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DawaB5mxWWaQPAAAD6G6ig
	(envelope-from <iivanov@suse.de>); Fri, 31 May 2024 11:16:41 +0000
Date: Fri, 31 May 2024 14:18:57 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: sboyd@kernel.org, florian.fainelli@broadcom.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <maxime@cerno.tech>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH] clk: bcm: rpi: Add disp clock
Message-ID: <20240531111857.mwekjpyetqmi7c5t@localhost.localdomain>
References: <20240531092730.253484-1-iivanov@suse.de>
 <4c56e57c-7a4e-4976-a05e-0adf3df13b3f@gmx.net>
 <20240531101813.fronn47dx3ksacq6@localhost.localdomain>
 <2a9fdc2d-7fdd-439d-b8b6-406b559d27c9@gmx.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a9fdc2d-7fdd-439d-b8b6-406b559d27c9@gmx.net>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_TO(0.00)[gmx.net];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 05-31 13:06, Stefan Wahren wrote:
> 
> Hi Ivan,
> 
> Am 31.05.24 um 12:20 schrieb Ivan T. Ivanov:
> > Hi,
> > 
> > On 05-31 11:55, Stefan Wahren wrote:
> > > Hi Ivan,
> > > 
> > > Am 31.05.24 um 11:27 schrieb Ivan T. Ivanov:
> > > > From: Maxime Ripard <maxime@cerno.tech>
> > > > 
> > > > BCM2712 has an extra clock exposed by the firmware called DISP, and used
> > > > by (at least) the HVS. Let's add it to the list of clocks to register in
> > > > Linux.
> > > > 
> > > > Without this new definition driver fails at probe on BCM2712.
> > > could you please explain the relation to Andrea's series [1]?
> > > 
> > > How can this occur, because there is no Raspberry Pi 5 support in Mainline?
> > I am using few out-of-tree drivers on top of the Andrea's patch-set
> > and noticed the failure, so decided to prepare the road for RPi5.
> okay and did you use the vendor DTB or Andreas' version?

Patches from Andrea don't have "raspberrypi,firmware-clocks" node.

> > I am not entirely sure what are you asking.
> Because Andreas DTS shouldn't require this patch and we usually don't
> include changes which are not testable with Mainline Kernel.
> 

So I should wait Andreas' patch set to be merged in before I can post
anything about RPi5?

Regards,
Ivan

