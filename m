Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87D43AEF45
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069191; cv=none; b=jojhlWgHXb+ALWweaO6vjaPKWm0DaOTi3yNPFPMQWutPHhm5vjpUyOYXgcv0ZQ3APYQ2vTwloPq5pG11duOvtaT1roZPk115vio2QC25Crqt0MPylnLWpITJzRbYOyTf65EaFgFm2WWeil8mO1mSm9WfcQfGQMI0gUxvhMuqz9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069191; c=relaxed/simple;
	bh=aP1l5mGckZi8uPiNMHIwqyekMx9AdADqZ5kasaUQLQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pL6HBX/rwbNppYYmk3pBylxGYjLSC4VQuAiMqfrwrQkX6izSC87NW9LTKCZkDVa+cLATUOMVoFZw1GMXIguwzDahseoVRUdJ/rbZL5ABQ6B47CXGMALFZquvxbp33osfEWaGFdKmayPVouNBvacPN7xOub2gF2xoUOWIXJIHlWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHK6+N31; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AyIofFFO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHK6+N31";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AyIofFFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773069189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pj7TRP/LukT6gDbE70HzP4GEHwGpkwj6GBHStbfv6GI=;
	b=gHK6+N31p84mUuK5/4HdrhtZesVSnEN56SUCQHMi2WK2HvgaWLxO9v3/LHc5kiVWdhd3ps
	o/nYoXUZQu5nctouY6AYNHMlrKZgzV0YcmkzpxL18ckQCApqHBmSS9qwLx4WWDwsAkyetj
	bPL3v8WsrL2D2Y0TjwhFVrTSP6h+Kf4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-wVr4InZLPky4hZRAfmd-DQ-1; Mon, 09 Mar 2026 11:13:06 -0400
X-MC-Unique: wVr4InZLPky4hZRAfmd-DQ-1
X-Mimecast-MFC-AGG-ID: wVr4InZLPky4hZRAfmd-DQ_1773069186
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so200518885a.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773069186; x=1773673986; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj7TRP/LukT6gDbE70HzP4GEHwGpkwj6GBHStbfv6GI=;
        b=AyIofFFOWUjwwDkalBzbnMGqTMoQ5v7wtorPqSLJyH6M57BPwdoiL2+OrLxBeu84w9
         5YfzVchE3Lx3FarScyoujRpnps5L0KAvOl1ICpfmweYNhxbkw4XWPzEI5fl2sBl1nAMU
         tFcvW+5DlTxfRjrCgwZjlMi3Wb5Nh7QZL+SYk8VqqOBhC3/HI17dIT1W1dps+4HBsiZP
         QNZWGaIE9VHVVmS+CHAgzwBgqzg/ZLchIa8HBCq+SypmlyaA/mJG8ISlzBTl6tlsKkfp
         L2aDBNd3VaqGYEBaKYrO9l5zxMUlFhMD6dly6ZOUDgVS8lKmtgSN3I9FZ75b3mNfFqn6
         W1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069186; x=1773673986;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pj7TRP/LukT6gDbE70HzP4GEHwGpkwj6GBHStbfv6GI=;
        b=ZQFhXiVnPvqt08GGbmozS0yZyZDpl00sj4wE1xFiK3EFL+C94Yt6/brtCW2inCXHPo
         8DfxA20U03XX0HTz7e29EseDtRcfYnRH+KU/jvTpueFvQ9jcH2ItGA685mGnn/W+Q8PW
         SqNzN8JzX7Lnlywkbk2hssX7abkXVnWjKjy+TTb02AFzRQJvhaLvkb8EbWwcAErebRig
         ZbyGW1ftabImBr4XUkRIytY7EH4B1RiXDx9cOg7SIKe41qljxmdUaohsQzORm0CBY7f6
         Yx2s+Dc5OouVdi8fZncktDzxY7Y4NFXLnD39GGA8GNpvV0Ho9cFX7f/jDpNdVwUonaso
         FiZg==
X-Forwarded-Encrypted: i=1; AJvYcCVxkuzBwxiuk7HD5+8aW2e+hCtlo/Lp1Xcu8cdFi8j3wo6gIkxDLUBm0sdg2La4k40b/E3oXvZlrsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJuX8chvfNzjfIGdJYisl8dRS/IdsTfiS66B15roTqIRaPquV
	5zIho21TVG5xmeeW/6XZmID780i0Ro5PU5u0jmga/jdKL7kZIR9qajBP3sC1SczJlqsljdFjh6T
	JZJd3GGIY3Y2CaQdGAh2N7Wh6rMP5BAcyJkUiyuQP75PA+KCNSfkjVLv4JI8yLA==
X-Gm-Gg: ATEYQzzZ/HTj5pkh1V2dfosF9+9noIOFJeAYEiG0SqrPlhzRhCAqH8XKbZgpCXxsw9k
	S+tQSDgW178/EF0xJKwQZp3DFMrtquJIVbIe/gbgW+fxNVYTDHuRxW4Yyc2TAPakHRtW0iHD6Tu
	qKo2p575ZYjob43uAO9dN3Sazs08PLF2VOOz1Ms5T4U4USHc0RMw7/JwDYAnXoEhZAiIS0yV6NI
	685KKgvSy3KjEH3hYfAxYNakX4hcW7fJRi+tuFbPpJgflg/JNCJ5tVa9BPEvuwe4Nbb3urZiWlY
	0t31NqkD5xbahl/oRMNFYnzlXtgt/0xlyCeBigDBXx42SCpeWqtDBzYdLBDLMvEdVlsFOadm04r
	Zv1TdK+Es+7XfJ62mL2/8e4EMCsydC1sTdPQgUDnJacIHyMll2Ze2tTB+
X-Received: by 2002:a05:620a:45ac:b0:8cd:8ee1:2ee4 with SMTP id af79cd13be357-8cd8ee1374fmr228104985a.23.1773069185907;
        Mon, 09 Mar 2026 08:13:05 -0700 (PDT)
X-Received: by 2002:a05:620a:45ac:b0:8cd:8ee1:2ee4 with SMTP id af79cd13be357-8cd8ee1374fmr228100385a.23.1773069185437;
        Mon, 09 Mar 2026 08:13:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f566fd5sm700212985a.43.2026.03.09.08.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:13:04 -0700 (PDT)
Date: Mon, 9 Mar 2026 11:13:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Simplify clk_is_match()
Message-ID: <aa7jfB2I0veouYTe@redhat.com>
References: <703be6fe95cad2e738c712877fcdaa63a7809802.1772705499.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <703be6fe95cad2e738c712877fcdaa63a7809802.1772705499.git.geert+renesas@glider.be>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Mar 05, 2026 at 11:12:33AM +0100, Geert Uytterhoeven wrote:
> Linux style is to handle early-on failure.  Inverting the first
> condition lets us simplify the second, and improves readability.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Stephen: There are 8 places in clk_test.c where clk_is_match() is
called, so I feel we should be good testing coverage wise.

