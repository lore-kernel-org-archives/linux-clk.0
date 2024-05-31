Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288D187554
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150721; cv=none; b=Ez+X6GaZqsnzq8NMX79mk6MxAytSV+pzI4NOvXwsrrAaPGajZxYfD5sBNe/X2oojjNVmsNJHKhooJmob6bVvZx3JZmyJ7VKosWHMLL+v4Css0gvv/pLRgfn6QE7iTZJqbe5bejQJ16AApsV89J7CuGQJHqpccSf81PRZss/+uho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150721; c=relaxed/simple;
	bh=nyZFgA47KM+lME/vUptDh6UGwp+ujF5W2QyA1Q1Gd3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohBiOlBhoyGrafe+plfnczgqVwkhja0r5WqFmOSqRltMrOH4v7fh8YVvf2QN8GFskhqRyf+uVDRukuc2V5x2oO9Xs1SZk5QKVYwJMbP4VrFAklwZGEPfPhSM+J+LCdp1Uu51Ls9UZRhdds9gV8FXo7UOppumcqkr/kibF3Q0mJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W3yzAljQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K0hPWcwb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W3yzAljQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K0hPWcwb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W3yzAljQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K0hPWcwb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W3yzAljQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K0hPWcwb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BB9621B48;
	Fri, 31 May 2024 10:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717150715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVkWErr7G7OnZmpnWQzy3VUCzm85GJZLYz31yJq8dHY=;
	b=W3yzAljQanxV4QstYbb3JnPvXJwcxco1XGZui9EGjedMu1dP2OmaUl/N1HvjFCDoGX3HLa
	OxtDPJ+qsZFJhbfN/x9siW4p2ChvQkAc+pfJLFP/DiZCiPfcRhp/ZJ+tk4SfDicuN2s+kv
	Wwq1c6crx1EeSn9vihhmpkXV/n6w6C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717150715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVkWErr7G7OnZmpnWQzy3VUCzm85GJZLYz31yJq8dHY=;
	b=K0hPWcwbdZkENCe9RfUSzz6hTp+1rHv/VBbTVKgQloROx7wZcFvYA/AHsL2aAHvHGlsJxq
	XDpfu4nhVfP30cCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717150715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVkWErr7G7OnZmpnWQzy3VUCzm85GJZLYz31yJq8dHY=;
	b=W3yzAljQanxV4QstYbb3JnPvXJwcxco1XGZui9EGjedMu1dP2OmaUl/N1HvjFCDoGX3HLa
	OxtDPJ+qsZFJhbfN/x9siW4p2ChvQkAc+pfJLFP/DiZCiPfcRhp/ZJ+tk4SfDicuN2s+kv
	Wwq1c6crx1EeSn9vihhmpkXV/n6w6C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717150715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVkWErr7G7OnZmpnWQzy3VUCzm85GJZLYz31yJq8dHY=;
	b=K0hPWcwbdZkENCe9RfUSzz6hTp+1rHv/VBbTVKgQloROx7wZcFvYA/AHsL2aAHvHGlsJxq
	XDpfu4nhVfP30cCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DF6D137C3;
	Fri, 31 May 2024 10:18:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id clMcBfujWWZVKwAAD6G6ig
	(envelope-from <iivanov@suse.de>); Fri, 31 May 2024 10:18:35 +0000
Date: Fri, 31 May 2024 13:20:51 +0300
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: sboyd@kernel.org, florian.fainelli@broadcom.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <maxime@cerno.tech>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH] clk: bcm: rpi: Add disp clock
Message-ID: <20240531101813.fronn47dx3ksacq6@localhost.localdomain>
References: <20240531092730.253484-1-iivanov@suse.de>
 <4c56e57c-7a4e-4976-a05e-0adf3df13b3f@gmx.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c56e57c-7a4e-4976-a05e-0adf3df13b3f@gmx.net>
X-Spam-Flag: NO
X-Spam-Score: -4.04
X-Spam-Level: 
X-Spamd-Result: default: False [-4.04 / 50.00];
	BAYES_HAM(-2.74)[98.86%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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

Hi,

On 05-31 11:55, Stefan Wahren wrote:
> 
> Hi Ivan,
> 
> Am 31.05.24 um 11:27 schrieb Ivan T. Ivanov:
> > From: Maxime Ripard <maxime@cerno.tech>
> > 
> > BCM2712 has an extra clock exposed by the firmware called DISP, and used
> > by (at least) the HVS. Let's add it to the list of clocks to register in
> > Linux.
> > 
> > Without this new definition driver fails at probe on BCM2712.
> could you please explain the relation to Andrea's series [1]?
> 
> How can this occur, because there is no Raspberry Pi 5 support in Mainline?

I am using few out-of-tree drivers on top of the Andrea's patch-set
and noticed the failure, so decided to prepare the road for RPi5.

I am not entirely sure what are you asking.

Regards,
Ivan

