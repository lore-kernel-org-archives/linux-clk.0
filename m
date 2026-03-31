Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3D3F9F23
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966332; cv=none; b=QYCf3UK7KLvw3tgrbPSOcgxG/13KeyrxeKm45TM7OmBY4B61it0rKMUvE7Yw8LWomJ8RPKOR3ECmvShjj/xvcxr68WLz3s+JJZbFf4WgatF57ScifcJ7yw3QiDHiXBvfICQJ9E8PZkHn6Xl1GIzmdwrIJtgpuFZMnGRTCLGaNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966332; c=relaxed/simple;
	bh=KQ495LWTIC1Qdipneddt6ap0OOx/f77SJvvfLUi7v88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSOmxg608M+WaAhO3mZUZsgQT7J6w8Xrs1G8R8c9yqfenIgZn+Sivxw8giuILMcLaZURZwCRfpeU1JQaeS8iBVxckTN4O45TOu8o8vpeOnBwKO9w5xTGxUWsPwhXFP4LP+DTDc5RxhlFeNcvrg1FyReDo+P4xPHeEizWC7ScX0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d2FDJ8JQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qj0ah/zq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d2FDJ8JQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qj0ah/zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774966329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m3LI5UVn7czK9stjex5abaN/lzAhvPFjSya8ojn+okQ=;
	b=d2FDJ8JQ4mK3HDCzS8yP1LgngNh/jLQhMBmb3Dr+Krm3qh3eQpv++GAVgKpL2u6Xtx9FSM
	B08e/C678/wPEjao45UsTVlbymOpwNq9lKyGWAmFG1I8nVTQJP24+huLqXTi0qh03zwyua
	//dzsw06Yl5AQg0I6rSgTty/PWRXjRA=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-WrTQ8WV_NnmhC-aht04WHQ-1; Tue, 31 Mar 2026 10:12:07 -0400
X-MC-Unique: WrTQ8WV_NnmhC-aht04WHQ-1
X-Mimecast-MFC-AGG-ID: WrTQ8WV_NnmhC-aht04WHQ_1774966327
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953c4a80ff8so709604241.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 07:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774966327; x=1775571127; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3LI5UVn7czK9stjex5abaN/lzAhvPFjSya8ojn+okQ=;
        b=qj0ah/zq1TyMY/ZflT7AGzZ5eTUVVskyqqfN+vKRCYQtiHXbk3tqh9PIVloalM8svl
         ieBSPOVeDdWGwGSG+Xu/eVaYzX16s9UU7Vh/WTYLMrC4jMAxLoDxI07qlM5vndmh/xma
         KPeo1srihYg6MiZBkpOzDvwFcMA/LLLUuyZ8DXTMJ/LefxxdIENmKSHUedEKvsf4ughz
         n+6mnZby9p9gHJnVKecEPJyuFoYz1mtlBtPBPE0CsWfRmgs2VNFy0fxs2qcXg12RQf50
         QLGur2g8r1NM3LhBnZ1n9ylQ8wR2pya5F2UMLHn/kMSqDAPMgWMm9Ul2Ol1jvtrl2AH2
         Rahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966327; x=1775571127;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m3LI5UVn7czK9stjex5abaN/lzAhvPFjSya8ojn+okQ=;
        b=o+3YQe5gHp65/EXsooJwWIaageazSWEEu2uqxsQfhydJmxyKVwdTa87vOfgjkiNA4O
         ef2atEO1+xa17VcT8GH2gvU93UZcWOsXDGZwEubHblWTTQ3FVJc36LiUcvFelCxeUiMR
         z0NL4lMHoSMgbQGqf0ZplCz7bDiJ80BBLQVlDwyytnDdRj6YTPJFqbb5Mf87JB4n5H+G
         +1rOqku7ENzFoIMEmefjpRjISU0XhYb5RvFjNvlU9ZAfK9GyUChKS6ZiVYA4InIV0KGO
         7d/KRrm6Y/8BEaIBfdWFXghz4eyGpOLPMZJHqp87kMM9bkPVVqA5IR/H38SnpeUA0wey
         YGmw==
X-Gm-Message-State: AOJu0YwDTXHEWMXk0RZbOMB4RovJlQ8MYDmw0V/ITKSduMwRPrC8+iXX
	n2xUyIG28Aot8fn8LCgX7GyTSx75dcWshZZ/MlYip3e+tRDq4ZYv4q9LvriNqDThOaCs+pDPpjh
	qkSIrBHT+QRQRa+UBQaFY16sisMDi7ghQG8WpKwxQBAes+H7bKdQxBLiM5MumWg==
X-Gm-Gg: ATEYQzyxDWHnruqxJNIfPpMvK8oDglu+Wf1lXEt2dTukDpq2ZTHHiK6Hu5gjTeTyLsy
	uWMKLwKGVjBefuPhf9HxmhwqMd52SQid6t4Q0iLHJVJ6kZ+HJQRzFjj3bClQHQEHPCT4XLkfY6e
	YL0OTA3lqZk01nNbb5l/VdWirAscIDI43ZxkbdVgR4vZhGTT6Gt8bvb8OscQiNsMnmlloPhbRa/
	lK/CtgBFWvwDr38/esM/ES08xTqZ87GJIoBbsgHF1cERg/QTaOs8qqny7s2twDU43xTeif775fq
	lDEnlDHDYyRUeJozbn5D4tdKrq4KjTCDWy1m00+HnOKak6EbNZPH4wkbJ510gF/I/frXc8nXOZ/
	s7jOKQhfx3j2mK4a6
X-Received: by 2002:a05:6122:e203:b0:56c:dd62:eb45 with SMTP id 71dfb90a1353d-56d4a6706a9mr7070063e0c.15.1774966326760;
        Tue, 31 Mar 2026 07:12:06 -0700 (PDT)
X-Received: by 2002:a05:6122:e203:b0:56c:dd62:eb45 with SMTP id 71dfb90a1353d-56d4a6706a9mr7070011e0c.15.1774966326123;
        Tue, 31 Mar 2026 07:12:06 -0700 (PDT)
Received: from redhat.com ([96.66.166.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cf18esm91809166d6.4.2026.03.31.07.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:12:05 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:12:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
Message-ID: <acvWNElQXPH4YaDk@redhat.com>
References: <20260330210217.11168-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330210217.11168-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Mon, Mar 30, 2026 at 02:02:17PM -0700, Rosen Penev wrote:
> Combine allocations using kzalloc_flex and a flexible array member.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: add missing transformation.
>  drivers/clk/hisilicon/clkdivider-hi6220.c | 26 ++++++++---------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hisilicon/clkdivider-hi6220.c
> index 1787ecefe601..b35c02d3bc05 100644
> --- a/drivers/clk/hisilicon/clkdivider-hi6220.c
> +++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
> @@ -26,8 +26,8 @@
>   * @shift:	shift to the divider bit field
>   * @width:	width of the divider bit field
>   * @mask:	mask for setting divider rate
> - * @table:	the div table that the divider supports
>   * @lock:	register lock
> + * @->table:	the div table that the divider supports

Why this change?

Brian

