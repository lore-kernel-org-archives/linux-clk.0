Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B527A477
	for <linux-clk@vger.kernel.org>; Sun, 26 Oct 2025 23:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520584; cv=none; b=foQPnMkeyhhcIeB2W8ZRL4/yVN6VuT29zpW+MqUADNrznzcyxIXlln3lPtrsOhmdjXgI+KZH89RaZgOogPYYOxRr4k6nbHZADX5B345EYtABTeIKjvVg4xdex0oMX3LBi/TO1VUTwFT8hiotfKQA9zlBejUtZjIQT+REQUFZxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520584; c=relaxed/simple;
	bh=KQ6oL4hiz75C/A8/vFj2v/R+XXo7kpXKDEDVyBnk9ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGiaeRc2D3XTqEuBUkQPgOBcp7AB45qe09MR1Fby5+QpuzXFOtYhQ4fibU1S4YgFH3DYhnsBJJ8p32kQgalWWbByzKEbwYcpqt8XFPfWcFStbXcSbpwMiEI53QrhIuOxWu6hs0j4S58/g6SZxw1QRGnyIUKSDU4xl0kNG7GlChY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ai6btCKZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ai6btCKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761520581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM9g2J61qUgy8rn11tUgr2Kr+gynrxk9ajK18D17/SY=;
	b=Ai6btCKZda0DZTigGuCkmv8MbkVN4JNjRIDvw1UNNnYOmr0Ri/nAWJ5mMIdywIbxF5yPXh
	G43G08c6nqL4qOFmUPfsy5wy3b6RfPU6E19OS2RDxMn833ic++wEuLJCFRYZS+WZd/AcI7
	8krKRfHf9tDM/ez7h/VkYA30eCzyG2w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-6f1GbjqXPt6dE4PjaC_-fQ-1; Sun, 26 Oct 2025 19:16:19 -0400
X-MC-Unique: 6f1GbjqXPt6dE4PjaC_-fQ-1
X-Mimecast-MFC-AGG-ID: 6f1GbjqXPt6dE4PjaC_-fQ_1761520579
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8a2594fa114so256972585a.0
        for <linux-clk@vger.kernel.org>; Sun, 26 Oct 2025 16:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761520579; x=1762125379;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM9g2J61qUgy8rn11tUgr2Kr+gynrxk9ajK18D17/SY=;
        b=Tv0JXBYcQRbunLW+l4PenmEKXOYzblLQCJwqlrkIxcD2w5siiRIwvtArEG3Xtfek6V
         iEDJojWZunJen1lNxcLowTs0QEPPc37lhQD/6obEvZMC2hLjX5NeWrfvns3/xhxwK6ok
         TeAP4Qo0X1+i1Wa1893tpBxEiza5oBbeB/E0pbyS7EC98RluwoyZutv4l9FxwB6io6Ya
         qUlg8e12Can9MZJyWUoWDYhLh4BexH3R5ZSiovCo06xn8mbGB7ajbOMMtlBoCEhcp5d4
         LP8yn+O1VGTLV+80bGtX7ucCBMkuiDmnksntdWdwJTcTu0YKIAknVmxZeiL1qWwxd9Q9
         thyw==
X-Forwarded-Encrypted: i=1; AJvYcCUAgQru6/H0/Orsi0zC6mJhPzx3V1/nqseISdrOkt6wJCBN18vCo6Np1YWkvRHHjFIoj0iUrNlGWog=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOK43KzPF1VIiX4UxRZtclrptuVv6LhYDy4NbMBUTx+/Lko+zo
	x4igQmCkXSTT0RTuA++RapKLa5csurODZvpiz4KG+ysWICLdIm7fGNwUe9c194+iCXptOSmT8ez
	Gdid7bN7qSJ9mIskwLGz1fGdkQpPtP98TJQhRajaiv+JjwaO2NLbCSi/dfPFkgsIG+dPggw==
X-Gm-Gg: ASbGncvjZHqN461hQaQRtJjdARh2kp9VBRJUY05bAuECrgZk40qVZmDQeatJmd9GgAl
	ArM6tap9jCrAhB8F7zK5y+kmQSfyB+Y8+N0JRaMjZYZcFzleFOnDXJCN4eamDkyewkCJsNMKM+h
	cfrpXpxWnAk3IBm5Vmu/t7bxZ4sRsXvi2QQNioAUqQH2JJawSswKlYkkPHgn3/YHaqm01kPuEwu
	e0xzKzTGkImUcrxM81MSkeVzGIuuc+sZGh9IDElTVQxZjFoPjr+jSN6X2rn3IjCPxwa6aC/ENWv
	gOHjuJlLrUYeYhgrzbFqu/ptNxo929jrf585F3vQXuTavxuUfHXtwnS5ngMuvWwyObMVK8ucVlC
	suqj3C40AjqsVYjv2rSwMMCiPwO5P
X-Received: by 2002:a05:620a:4454:b0:809:b21:5421 with SMTP id af79cd13be357-89da1bae914mr1370444185a.39.1761520578744;
        Sun, 26 Oct 2025 16:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0exW7QsnW96XJU3LfmVTRq5OXRYKfDNXF9pTY84ykGNprSECOl2LKm846J2PimjM64qIFow==
X-Received: by 2002:a05:620a:4454:b0:809:b21:5421 with SMTP id af79cd13be357-89da1bae914mr1370441885a.39.1761520578329;
        Sun, 26 Oct 2025 16:16:18 -0700 (PDT)
Received: from redhat.com ([2600:382:7702:71bf:259:17c7:d468:3f55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2421fc6fsm435746185a.9.2025.10.26.16.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 16:16:17 -0700 (PDT)
Date: Sun, 26 Oct 2025 19:16:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
	mturquette@baylibre.com, sboyd@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.17-6.12] clk: scmi: migrate round_rate() to
 determine_rate()
Message-ID: <aP6rvQD-bwSkhfU5@redhat.com>
References: <20251026144958.26750-1-sashal@kernel.org>
 <20251026144958.26750-39-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026144958.26750-39-sashal@kernel.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Sasha,

On Sun, Oct 26, 2025 at 10:49:17AM -0400, Sasha Levin wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> [ Upstream commit 80cb2b6edd8368f7e1e8bf2f66aabf57aa7de4b7 ]
> 
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops.
> 
> The existing scmi_clk_determine_rate() is a noop implementation that
> lets the firmware round the rate as appropriate. Drop the existing
> determine_rate implementation and convert the existing round_rate()
> implementation over to determine_rate().
> 
> scmi_clk_determine_rate() was added recently when the clock parent
> support was added, so it's not expected that this change will regress
> anything.
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95-19x19-EVK
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Please drop this commit from all stable backports.

Thanks,

Brian

