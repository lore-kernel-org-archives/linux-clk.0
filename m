Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9306B3451DD
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755547335; cv=none; b=Q/1Fp/VFte9ZfRVL5Khi1ofxPRwp+IAmuP1u6/PHLZ6I24oe7/nuZ59ceTFYGHxTMariz89UK6Esx590ocmA3/MGldt83DX41nXb4oelRiXAXQV2WDp/Wc+47mj62WOCMnF7eD5u/G+blBemi5gTLsw9ppY+0lbQr7mCMNyPGwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755547335; c=relaxed/simple;
	bh=qjmLUZjHQ5QD9oJntM9nVj7N7ya7TqMjrnF99c2YdS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1JWHjbRNvMJlYQASyzpEOpFJXTigsP3yFl4Cyxw3hcPMFlDA5g9Ta0xp9/vCm3waLYWch2ewtK73HSSMrNxdo8xe5Nt/qvlWrlr2r0aIJFjLxw+xJFWZIxRYgMnrGJp706IOtGMK8zBT0cboeR1V8A0wD9C7ghbqiH1sAvcD0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dvVaJmpA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dvVaJmpA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755547332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+fG5ZGl1C62cZQFaAJ90q87NcBu2h7Rp+foxmE8Ttek=;
	b=dvVaJmpAuJfSkUAcngRfzMOLLgRjRGfSTRz60i11JxBKVngadB5sZg2b0MbZvsgIQGmmpc
	GfoJFQ37Av6EibHcQ+7LLwn48uoV/diuEtXsGCZdvNJhT+q2TPtkimLWyNR2IgRcq+wRnt
	uzhvv6RbADOmXeWCDDoKPtmo0cAYav4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-epA0e0OePRyi9sjC-pDayA-1; Mon, 18 Aug 2025 16:02:11 -0400
X-MC-Unique: epA0e0OePRyi9sjC-pDayA-1
X-Mimecast-MFC-AGG-ID: epA0e0OePRyi9sjC-pDayA_1755547330
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-afcb7338319so332960166b.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 13:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755547330; x=1756152130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fG5ZGl1C62cZQFaAJ90q87NcBu2h7Rp+foxmE8Ttek=;
        b=sKh925BPE96IrrZF936jjcMK6BGZ8nuXJU/54iALTH/ZaCkiNe2tg9ARQ6XE5j9F5F
         PtpFCn+1sgdChKFF9yGvGYLWbHeAuhEmyhQW5epnSLhJpl3SHmBE5bnQzHY6QWsA9/Vh
         a2wLWfImx9lN6mNM4Mbya0bAkM29BeeWeHcMzccSjIw0gfXZ+X7acNMJ6Y9/RXC0Z/UD
         gfMh+B6IfrHNjD9D/Vpp+3o85bOclI34BuUeU/ZiPuQOhmZaMUp/R33LgRnq92R/6gV/
         JO1do7ezRrwVGORb1RAlRGf0yEHChBtjLznJLgZYGVkb9ORO/gFQFVM+Y/F5TEHTnflP
         3OJQ==
X-Gm-Message-State: AOJu0YxKysIdM5+VfanvirVRIxhpu5K02I77ua/r8sWVwraedxmsegiT
	AYr6MLf86V3STRh0PeR5eMuDx0/JF3VH0ufaNa35u4s0pm5bDXJMjj5qZX0HROaWmJbrnLUuLqS
	qo4Hc+31XFdE1GImCjylLUhp6gg088DrWb8Djszu3fFZEkNpz46jeWuKLY7xkh4fXHQzVBYqbSw
	eaRmsPXSwq2Y3eHg55qxpUgxz/h6eLDHa1InlL
X-Gm-Gg: ASbGnct75tmTYFH+3sc1+4S3mz2ZtkqlM6JKe3KL9Rk5G2qFpwcmc3b3Tv6iqhmgtEE
	iGlSK0RyM6pf/rJhJqZNSutxtDo+mXry1mH8X1T5J2tVsFBYJzVe1/UfJL84DMw4s6LaQk/ABBL
	FZozgOAv+uOTN4Vn7OEDxL/BT9Gq7D
X-Received: by 2002:a17:907:6e9e:b0:af9:566c:4cd1 with SMTP id a640c23a62f3a-afddcb815ffmr6650166b.24.1755547329847;
        Mon, 18 Aug 2025 13:02:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Z6YJYYcpHHX5vpa68pR+vUhD0YFs4ADGuF96s+2h4oESeiqbIO9Y8YyPLEqoOxV16y8wZ3QXEoGXDLW/TU4=
X-Received: by 2002:a17:907:6e9e:b0:af9:566c:4cd1 with SMTP id
 a640c23a62f3a-afddcb815ffmr6647666b.24.1755547329385; Mon, 18 Aug 2025
 13:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com> <20250812-clk-tests-docs-v3-3-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-3-054aed58dcd3@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 18 Aug 2025 16:01:56 -0400
X-Gm-Features: Ac12FXxrVE5SCQ9rFBJfDNiF5LVNb7p52sPwt4Nq3ZChgQz7oePbloiikJEf1XA
Message-ID: <CABx5tq+yDZ2GL+ekvQAXHGXUbFF3KfwN5ts5020RpYFYZNcUzg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] clk: test: introduce clk_dummy_div for a mock divider
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:40=E2=80=AFAM Brian Masney <bmasney@redhat.com> =
wrote:
> +static long clk_dummy_div_round_rate(struct clk_hw *hw, unsigned long ra=
te,
> +                                    unsigned long *parent_rate)
> +{
> +       return divider_round_rate(hw, rate, parent_rate, NULL,
> +                                 CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAG=
S);
> +}

I sent the wrong version of this patch with the round_rate instead of
the determine_rate implementation. Kind of ironic given that I posted
various series across the kernel to get rid of round_rate!

Brian

