Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A745090A
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775053049; cv=none; b=oRRp3oa1+yX8vwG8dYWbEv/gSK+kmU8OQ8Kue6sna+FFNtlf6t3tObNQbd3tcX4CrmDkxplPetf0BYgLcDaAJxuufa643ylcRy1ealhH1YRBV9PbW6n6Oa+I+/Mmn+GYQ45WQgftLccx0Gd9Zk9rbjQH34k9c/MHBqq8p+k0TS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775053049; c=relaxed/simple;
	bh=fuyaDoSZ18zB+Fga7fJ2Gexi/1IAc9pu4NOrED0oNwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMoAQOE5xTWh0zagvRoGgnSsxJUBpgdJN1BkIGWm0JFjcpd8C9tMo67Ui1eWrjN2CcHcQs27O/mcHA1F9RNp6YvtSRDYg/8juH0XFuzrbBaWPOE5L4BGNkWIY8klO3dU0fIBiidEPt/iobqSYe5354N2bOIk7IIrRt4SRmQgDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKswcmXG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SWRjHkcJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKswcmXG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SWRjHkcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775053043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NFMG4OKN/qOJtparR2ERc5bRfk3YRi+18w3X91osJrU=;
	b=NKswcmXGe1VJky5HEJItDU7MpKkPntMTQD0kL1wm2I/xNgBx9OsiMtVS65qZx2K7m5X4Sy
	GCcC84gcbSKeYBArzpCiuc4Nh2bkQdAgnqvQcOk/w7BoFK7vRpk8vmpHGXBkcZFD85jFWh
	1+rgKJzATXv+bVIrH/c5rNMIBIOzPH4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-8ewDkm5NOUiA3K6Ou0ZOzA-1; Wed, 01 Apr 2026 10:17:21 -0400
X-MC-Unique: 8ewDkm5NOUiA3K6Ou0ZOzA-1
X-Mimecast-MFC-AGG-ID: 8ewDkm5NOUiA3K6Ou0ZOzA_1775053040
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-951b086a5e6so2409510241.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775053040; x=1775657840; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFMG4OKN/qOJtparR2ERc5bRfk3YRi+18w3X91osJrU=;
        b=SWRjHkcJxGsszPNNa8Tytb6pXW1ED+udTWR86BldWdOW0OszTL5JGkxhQpdguOO4QT
         3uKObkForS7ThZub6OQUMXae24OMeLEuVjxy5sRznRJ771jNCE2l0E8o7rErLqsOT1vM
         MRMkyQtOnZZrgAb3u/+EVp4cp/7pLeYLeUhgZ7INcKW7TJ4NWS043sYReNwZM4J56Nhd
         p7RMMLwgJNBmUa//tHy55j10mHlaaSks6sQBjKW2ayNVmCFaAVE74wUrDCeGm/NBDJY/
         lGA/sXfvVX814whBIgh7KP30SmRfA1FIOVd6TyNo7NsdDaOSoELBAfPog1IYfrDBrryL
         WchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053040; x=1775657840;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFMG4OKN/qOJtparR2ERc5bRfk3YRi+18w3X91osJrU=;
        b=iJaMXCC3gWZe/KR6BwhqT+iu7IsBNR1TW5Yeh7uv164aW99BM/d7UnUSsC9tRpZw+8
         ce73jg+NB+CoS54aKWDPU3SFnc39bUsklmmAS41f+VAddC1N2e1mk3OzpplefMvSPSr/
         Bu+I1TVjC7vYt4B7a4Uq854cTOv5IGzbDI70gxwNdX+Pk4alMlXJLtOzFVtrE9PIyqKG
         yhi+lbpg4VdVBNHQafXnjZh7SEgEmBaLL8gi/XZQ5EmajXFsNsqP77Wom0X3NincxnY+
         wRttghuv6CNwV/avpLpcw6q6h5XZ2jDqRiMvpu41Sv50EcwTrxPmIhCH3Bt0dJjSEvrJ
         uqYg==
X-Gm-Message-State: AOJu0YxuGkiwPGaBipU4OUEHT1XMEMCc9KqgnXJYwRxlQIp7TESM5Sgu
	C+3EQl+9RyasEN15fRYsiigo4hjv1RH3Vo5lCQBMa1eBNgUa845fPknY+ae0RbbzeJdEd9O0xO8
	ezqs+tw7Ao9mVInwUUAJkraPNlix7GFcy+RidNXbdQgWhlUGdgVM5BONSKqbbCA==
X-Gm-Gg: ATEYQzxq7muJJAZWyxYC7U0Oz22TN58NahDqVgobIKdHhrUBesC1bOfX6Z/ulRP6Gmq
	5GqELDG/m9h6zCqrSXNIMc5xd72H6UeP525ZQKW2udiJiJg18s9vIw8K3ZdMqcP52RkNyxUJ7d7
	IF+1GKfUTNLPv3hNE/hea94xAVR243RTyAT7mI7UpavFiZaXLMDcVLvOF6AdFXpt9bgx8RsWC03
	6ZbpSBYj6PQTEEq4amhHuEMm5nBJxHThn4N6lZFLxKBOULHTc2VTaRhoxw6r+cBefvZI22Kg0gQ
	ELsGJzqeLLbv4us5t1c5RJ077HZhfWkT7dcbHzvDbgbuV7RkI2ODezl9GdZN9+myvGySCViHr6y
	qPzF8UppuQy3BP/Er8R9jlnV43dP3BZEfB61ObY3ZEy70rZF4IC+zDnUX
X-Received: by 2002:a05:6102:291f:b0:600:11e1:2a49 with SMTP id ada2fe7eead31-60567cf20a5mr1367782137.7.1775053040556;
        Wed, 01 Apr 2026 07:17:20 -0700 (PDT)
X-Received: by 2002:a05:6102:291f:b0:600:11e1:2a49 with SMTP id ada2fe7eead31-60567cf20a5mr1367740137.7.1775053040139;
        Wed, 01 Apr 2026 07:17:20 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89f3ba99abbsm111010486d6.28.2026.04.01.07.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:17:18 -0700 (PDT)
Date: Wed, 1 Apr 2026 10:17:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
Message-ID: <ac0o7XbBm8aBOa7a@redhat.com>
References: <20260401023551.27978-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401023551.27978-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 31, 2026 at 07:35:51PM -0700, Rosen Penev wrote:
> Combine allocations using kzalloc_flex and a flexible array member.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

For the future, if someone asks for changes in a previous version, then
be sure to CC them on the next revision.

