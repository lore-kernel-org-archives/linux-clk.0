Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9969392811
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952183; cv=none; b=ePEBVc0N7KZISTq9hCXgIbEyCl4l14ENoMrIY0FzwB8LXJfmyiMty3L/r+TzXSu1wnd6H90N7Ws8DGlpc6YfwFulpqQ6tFKUPOgN9u0gFSPFl/vHYM2BA0knUJfXQiemKrlQEXuc3MptmMWVNJdphlShEEMpyKP7mfPsrxXmXDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952183; c=relaxed/simple;
	bh=C+g+TTLG5loMlGQvWMOxkk3GNceJUxAI/xPhBTRJyio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZeZBFXCcT2PxbDGdNctJvNyX8LNMqkT5iwnNrq0ehDUt3uw3rd820pm6cmLNUkzfSWm73/kmNAFiKzXaeX0BBZoiaG9aFUqF9QbpjdOHHXba+Ouhjc5C8JOp/C5wlq23NBAMqnVeKkeaIdArAG9aqrl1nX05HN+fN2Acw++8tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IHRVHS5B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YFhqF9JW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHRVHS5B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YFhqF9JW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790952180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AO+wjd+TbEeTabSZ1MWHhZEnfR90lPmO8HDyBou5LhU=;
	b=IHRVHS5BuWU5BUKrP4NZsA2orQ8xwvvFs3Zv1YpoEyDg8JN0vaWHTJnb7RmslFhloAsad3
	M5tLpHrrk+6+1yugU13YB0XweKAx0ewDM3Vntf9ZHrTVpe4A3lsaH1+Rusm37cA0vU4P3v
	UZdbxMFwo8OJ8STEKA5fy83BvimZrXo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-Lpy-mV9qOi2TaFFOH1lxIw-1; Fri, 02 Oct 2026 10:42:59 -0400
X-MC-Unique: Lpy-mV9qOi2TaFFOH1lxIw-1
X-Mimecast-MFC-AGG-ID: Lpy-mV9qOi2TaFFOH1lxIw_1790952178
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-914321eb48eso1605106d6.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790952178; x=1791556978; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AO+wjd+TbEeTabSZ1MWHhZEnfR90lPmO8HDyBou5LhU=;
        b=YFhqF9JWv965okNxmBv5FODDMY4+5uFbgnvPjMYyjRrGhO83QHd6BUxfPSV9of3h1X
         +RlugYp2K9fY8whdIOtbTpwG5n0nd4GlXCo4zMz9iQtD3exyyxZ4fzjZpiyFk3JxnMmg
         UDmNOfqNDREW5+OW2ELhecRvDCSZB1SA3UMSJVOe8gszhdL2tN+wfKhsaIJ0WXK1q2M0
         6RAFE4scVhnWqSXaDxpSZOwS/MoBBwJZNEEzo/m0joznTEWfP/+lxsRsZQSUuljXR0ak
         ksyPzSEgYmP7tXwzf90vDw0iqSofOBxQj6e6i8ys0m/THxGax1rczWBFARb+4bWutQwq
         +QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952178; x=1791556978;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AO+wjd+TbEeTabSZ1MWHhZEnfR90lPmO8HDyBou5LhU=;
        b=VGjfeRhilZ6ziJFodVrE2a+JnzwdAuJ735en/VmQahZdaUmR8508FHmzPRqpyVoeCp
         ZlDEbZbkVvEIarlvc4dMlAMnNqUxP8SmhEfBovCBn1YoamlIFF24cLBsSCgoY6MjroN0
         yW8Fh0YUcW+SZ3WA7h8wBHadHoSu3XY+w8O09zjl2cUoeBlBqi9CM7WeMvge2EA0OVKl
         QRQynqp15bLBphQfZSYUql5iTYcljM9oFYV4qfcLU5UexWVP1O3p6vW7kaArhtduw3Oj
         oh60VnVtBbhrMcDAJes2t3k1en0tNrj/+BuzTwIic476wPIvIhNXty0SEwZcrbhw9YdL
         Udeg==
X-Forwarded-Encrypted: i=1; AKwUvBwiQMSUQavujsP6oyNQ5u0zvZGxgHioXvvAKezsMLVYBPfeHm/gfIV4mKwr/zxs05b7yfQpFVwcKmE=@vger.kernel.org
X-Gm-Message-State: AFuF++mge9c5TNv8f9obc370f86m5WO4T534mlLrp+XsnmeF1tE8ROYn
	gSIZqWwrzMsO6qDiE6/ltE5kUHy2lfRAKwaFLFbk4RMIdDPunaR5oRws8qcNa6jIkKO9A9OeG15
	acjCyw1ccrKhMqD0SWuPVo1CkmMbC2j3ZSJU+G0uPq+ullMB00Q93IFfFnwUwcg==
X-Gm-Gg: AYBFou1ECk5YnGOgIAmAx5ubD5ufMKZoJWg02qySpwJ01oy2NnqFs8D51V6/5EDJcJs
	njWQos5tf8EjjATYBOLEbfshX0fAerJBwuMYRnj0fEBcA6U9noZSM5BIFbedZYzdLBhGm3pocZy
	7aWBUYkaBAjmoiJX3a75S8Eq8xiPiDAwzr/FkaAQ0XOqkspQIK6BhFIjYbmkvVX4qcajZPp+1YS
	bgZfjTY4xHPDK871mGG2NVlTG/iVB8o9KEPHJ/y3iulhAhMNDH1G9uv9mg91r1dO/JryMBUhe/D
	FfmrhZ/nov5G+M+toI6oedxWWVcdToWjNnJX3gh+WpZK78IkxbRfL85W02UwCqN+BlDAtY6YEq0
	D+EjpyRaFHXcqTdiut/Um
X-Received: by 2002:a05:6214:8587:10b0:913:ffb2:e8d9 with SMTP id 6a1803df08f44-917c01553cfmr43877006d6.40.1790952178457;
        Fri, 02 Oct 2026 07:42:58 -0700 (PDT)
X-Received: by 2002:a05:6214:8587:10b0:913:ffb2:e8d9 with SMTP id 6a1803df08f44-917c01553cfmr43876676d6.40.1790952178009;
        Fri, 02 Oct 2026 07:42:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b6b636sm21082406d6.26.2026.10.02.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:42:57 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:42:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.4 (take two)
Message-ID: <ar_C8HD5hHsCgGl3@redhat.com>
References: <cover.1790939760.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1790939760.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Fri, Oct 02, 2026 at 01:29:05PM +0200, Geert Uytterhoeven wrote:
> 	Hi Stephen, Brian, Jérome,
> 
> The following changes since commit 8d90c0eeef104553d6b9137becd7f58b468aaa0b:
> 
>   clk: renesas: r9a09g077: Register SYSC regmap (2026-09-14 09:47:33 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.4-tag2
> 
> for you to fetch changes up to 21cbd7ec29930f8e7e156e18b81736f099f03849:
> 
>   clk: renesas: r8a78000: Add SGASYNCD8_PERW_BUS (2026-09-28 13:44:05 +0200)
> 
> ----------------------------------------------------------------
> clk: renesas: Updates for v7.4 (take two)
> 
>   - Add GPU clocks on R-Car V4H,
>   - Add initial support for RZ/G2M v3.0,
>   - Add CANFD, thermal (TSU), and ADC1 clocks and resets on RZ/G3L,
>   - Add I2C parent clock support on R-Car X5H,
>   - Miscellaneous fixes and improvements.
> 
> Note that this includes DT binding definitions and updates for the
> RZ/G2M v3.0 SoC, which are shared by the clock subsystem and DT source
> files.
> 
> Thanks for pulling!

Pulled into clk-next.

Brian

