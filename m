Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106840BCDF
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781541227; cv=none; b=q7rdATzS4zayxB39UGgf8Yt63q2tqzW7Xhduk2QYEZuUMViv7eGa9Zm6i8PHSzSn8zzbD4zrbNynpGo2ZOgtcB31triujA5T2fl017IZvzSm5nnW6Y8ytgsOfotMh2grSsvSqjFIdgQpRj82NOcxwiY/eWsZ2RR1R2Ez2JU2abU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781541227; c=relaxed/simple;
	bh=2yIRGmGTIWoauMOGJ2GnvGu9kyAbF/MYkxPnOl3/1cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJJWgHgwQ+bYoLZKCeUeCoB1o321Ac437k3KlDF1W4EW7aCjsOvmD42p39B+8U3zOaLI8/HTYIq3ET42pCWhBqkna53sIidh4v+mM0uORKrZKRofJf3qp5o5CPksj7ulcEYgMjuQMl/nKwyR8022pnVfh0Z+LpAh1W4u0KSYzn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=if3Yubh7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IM2ZVyqn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="if3Yubh7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IM2ZVyqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781541225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g5YgGUo7AEVnCVHtnVu0jF1gu1Ki+WZj6PX4S9DZv+0=;
	b=if3Yubh7kcX6FMXddTaobSPoywyP+PJSuwNRKHa0B4Ho0JGdcU2C87U4AoSIiPVTXbMNzX
	UvvV8GjaT5I4EsjmGPXO4MrJBXECuk6GV+6F3t/Ur5SpGbLQZVyKJwrFzkWPgw4dQDQeoY
	muMK5vVZr3LTwhGmpoEyQCtaEMGobJg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-oqPiACIrOcuaYPnfSefKTg-1; Mon, 15 Jun 2026 12:33:44 -0400
X-MC-Unique: oqPiACIrOcuaYPnfSefKTg-1
X-Mimecast-MFC-AGG-ID: oqPiACIrOcuaYPnfSefKTg_1781541223
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517615db531so88638851cf.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781541223; x=1782146023; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5YgGUo7AEVnCVHtnVu0jF1gu1Ki+WZj6PX4S9DZv+0=;
        b=IM2ZVyqnHSkQBmZrqvLePWQJTeP1EzdqGN607GlXmgWYXRfBT81n6y92XHObkW2cuo
         gscy6L1SoMwIeoVI6JTF8T0OdomLCiMEImICKgF8ikSGgL+dTAkPe/UVUL4AT5L87BDX
         FxWEGxhp5VJ45jly4j2I7qP/SBZ5SwgXhooMgJPJFX/3tt5efwUxaQ9NVuuE5euJUG7S
         yIaERFOmYP765EM3vf7DQyk8U6B0hUx+HqjoSxGcnwAtnDEKHCw+LlYC1H1lhDpZi9rA
         xtKEgLkQzjKTS6JYHeqsIDoy0BX49n+tzE5mH7PlZrq8fiNfgpcf/y8Ir7qMANyXdgZ9
         e1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541223; x=1782146023;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5YgGUo7AEVnCVHtnVu0jF1gu1Ki+WZj6PX4S9DZv+0=;
        b=IxJfdS6VWB/EaVtG4U5krSLg9M8c+AvcVV4D66eqMIvffpn1h6JNU8mzkWZBOgPst2
         UjAjHvohqi+i63q2lI5Hx5vnxzPAKVQ95u2u5AXNIcAGN6DTJa4gOsnjtq0DkhTAdPks
         bR8x0uAn13pH2qd8r4bFzK2prm/Tn/M8oXF4FDof0UabLfsREnnJUpXo8x5TtQX0qnxM
         ClnyRF0PE7IKrqPUwrS5Yen9wajFemlAhXgs/beoXJnYU4J8houJe/FN4wl37JXeSu/b
         34Uow3n9hWcR69xWdej1k4h4vkkR+IASIi5AUlcGloNouSewdBVrvNTtI0XM+UUQe3hi
         hIwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WQXuCvJtVYM/wvODnhqB4vMUS1/iXX3V0TSuAejCWMW7cy4zDuU1FFBE6nVF62T4JllRhr9DZp3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBvkz7TY750KJjYgTN9Srpq4d10QL4Vc2Dd3OIgG3Q31XX3vKH
	9ck0sfEzwsdP2OY6X6/xIW+/yZQMO5kAfL6KAVJJDHlmeU8nfDHdP+SlsXNccEqX4omOIHve3Ul
	0+pwjImY9pY52FogscLwqSqege2T6ZK6SzqN9fF9gPdvBDCUXJMICaTGG56qdqo4YYPatTQ==
X-Gm-Gg: Acq92OFXqi8fey76i6nlxXO5gwFbkz0mMJ0RyvMVzik65KRmlAojANuhmsc/nXFjKdD
	CYLcI2moCWctsFaPa7TxYhgVPkUQogA5fdDwR8JFkGy468qXnr6zPMxZujsXfCBh685SerDKcyL
	OKQTry6MeyaIV8noqKxQj2o90Gm8ILTQ1QLq6yEHPUdDz76AQA3iBX9isFg/Us+GOkDQ8Y3fvMJ
	CulezOX9TDHy9V0piGFJv94ExAiiTLgeOP/VW4hcAigExkoaBH9V2Ik3TTZ+spCusn6zpC6sYA3
	gr2wGe6UKPIdb/XKc0umL/HsqB4m5QdsMrHyV/WwIJ4sz+L0zeDLJBerhpAhA3zxbOlhfjvwQ2/
	t4N0uA043eqF5aFsod4VZ1ZAkbCKroSDn6CN5hrWymsx4re1I+EFmNiCr
X-Received: by 2002:ac8:5892:0:b0:517:8c0b:66cc with SMTP id d75a77b69052e-519533bc447mr171342201cf.25.1781541223360;
        Mon, 15 Jun 2026 09:33:43 -0700 (PDT)
X-Received: by 2002:ac8:5892:0:b0:517:8c0b:66cc with SMTP id d75a77b69052e-519533bc447mr171341671cf.25.1781541222849;
        Mon, 15 Jun 2026 09:33:42 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb64202asm113536721cf.9.2026.06.15.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:33:42 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:33:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: david.laight.linux@gmail.com
Cc: Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH next] drivers/clk/clk_test: Use strscpy() to copy the
 test description
Message-ID: <ajApXH11zz2ZhN3G@redhat.com>
References: <20260606202633.5018-35-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606202633.5018-35-david.laight.linux@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Sat, Jun 06, 2026 at 09:26:29PM +0100, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> The buffer length is known to be KUNIT_PARAM_DESC_SIZE
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

