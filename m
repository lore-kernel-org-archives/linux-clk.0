Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C91355F49
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052348; cv=pass; b=ouuUqQ5ce/4aMvxxAZOIjnSVsF7UyLW9J7pmQjsSTeQNvDiYtnYbQFFhCm0I2aDSlOEQoUoDFDd/fFcmV/ORABitQqP8tfmx552v1/F2dNtR6i2Pu2JlGxxO2nrafUyPsP+tIX3QFMmg9N6wbHlS+3xEu1DB67Me8gj0VN8wbHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052348; c=relaxed/simple;
	bh=ES4m/+XXdJvfwCgDwA/EIjZr9bsFI2wq/QVfbrnuRMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+FO0z5+js87Ruu4iayGUw4Md+nauFE4uBjJActBpGsA4ccgcIEnsvGudAQnsvgMUmH48fjVSuJAjYzwT8vEGNsYxEDEc0ESzwuKsK2SNyiiXTqCxFsH761V9eoDA/m7iMP2Hkhf+KOGGtBJFQfiwkjMwJrMwIXCG49T7Bu9g/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hq5yzVCL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mVRUlzEK; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hq5yzVCL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mVRUlzEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773052344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ES4m/+XXdJvfwCgDwA/EIjZr9bsFI2wq/QVfbrnuRMk=;
	b=hq5yzVCLaZRoAZJtJ0fl2QwgxCLYfsIvcbrSF81MOrRevzGoGp/f7/61xi/5kJEEHLA7Wr
	ua1UDokwAzIHLDOkAFTtb1fpfYsQVh5hjfKOiCDe+s28LPGANSroNvQ6d3efiBgmG7w3Vv
	XNt87kpj6LCzyUcPk/ROz3nxY+lEfNM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-60JoSfT6NiiMZzDE4it_NA-1; Mon, 09 Mar 2026 06:32:23 -0400
X-MC-Unique: 60JoSfT6NiiMZzDE4it_NA-1
X-Mimecast-MFC-AGG-ID: 60JoSfT6NiiMZzDE4it_NA_1773052342
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b941d4b7f2cso311972566b.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 03:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773052342; cv=none;
        d=google.com; s=arc-20240605;
        b=AtwslrwoF3TmnTPvNRmGkRSyFb/DRns1SMOtzjVT5gf1S5rzazQT78KAbnNrtcNZpg
         LOWcYMv/0dhpR21ww78PhzXNMcljcbvV2KLZFSvUKKfQzDoVgK2ghlVy4XjZR3gr/KXv
         JBwKufw8iFv1/iHsozqPDIM9ypZI3DdJjb0nKThwb6ELp/VvdCVC9JP+xoyQcSSghVpT
         eucRJ2qzQcwOesJAesJqTLSdYF8E3Rgs9NXrTk1B2BnRfkeY2xHoXuXH9M5XuJx8ey3E
         deG4EGP4o0DmeGu7KH8ZClPuANehXRI61IcID9pSvpCC8r9TOSA1sbqPR8NtZLrQuW4M
         e+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ES4m/+XXdJvfwCgDwA/EIjZr9bsFI2wq/QVfbrnuRMk=;
        fh=histFZijuBd0iAjqsgnJvv+BAhNBBKUMrERju/R3fus=;
        b=LULcZ+wnGkKfPP9yr9gkVFlCuJiiI0zgvKafkUz2uudpNHB+xhoxCHtZtn1d/OD6/e
         gbF+FoZpxECp4JKTU7qH1lYsF1Hi0t/4vKVjzlte6CIAwqE9FOCkJ0k9iO99aqSdVlLL
         1TrUmESY9N/UY11SUoAJxIl8Wc4ZWzcpEcv/dmHeUrTqsyYcDookh3NNaOsEXXBPtB0g
         ly1EF6j4r6qxaYYUA5jWZ9sOgqw2LNJW7UOTtD6qWIJCNNiEMyX1FUoTk2qXoEeWrqn/
         vXtBQ/Y0csNPrsgNPYJqXxBd2nUUGZBjm5G97zM5kIc+Q8GsDxXPvyrdtWMgbPdpbJNr
         qoIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773052342; x=1773657142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES4m/+XXdJvfwCgDwA/EIjZr9bsFI2wq/QVfbrnuRMk=;
        b=mVRUlzEK7gRlqvLOWuJKI6Zo/C4sSP631zIsSbzGvQZznB77YpLlWDuDOQBKrdRapQ
         IeiiTXDPeaUSQ6HaVcjmGGfMWzUqCz9UtqE0q8szAk9oz8mBOLfPjGCLJxGmTo0hUyWX
         V3R50gM3GOvtXUTk1x4nMOcOUmWjZJqsrn96dcWXg8QxqnXjH4GcpZlXTIW0C5dl3AeC
         qffTmWbqFrtU0oLq9TX/QL6v0OfvCIhK9RJCtM5AXCLO/cyJZlNEW8s/6bMv98bDQrLN
         ChaInLzQYj7X8JH0EiXQYxM4MpLo3iVut9l3jYJ5x2C/ZpAJhRkH2ifq3e3mQnfrsrSk
         AwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052342; x=1773657142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ES4m/+XXdJvfwCgDwA/EIjZr9bsFI2wq/QVfbrnuRMk=;
        b=uqnAhRfglYh9mKZlnHVWCTrBrEHfCds5bWKxaMAEJfiYXM6AWlraunZDDJWrpYd7CD
         P6zd5uwELFM+uqQlPAjc1oejkMl8n8tCRdVll1hUIa/XwqGmKQZ8omPd/PLGQirLc5HD
         YkUG5qyqkxvG08/wggWmIUFK2CXRWUd/L9uL/T/jeb2MNh2qDlKNbSMl37+Y8wGdhCBL
         DYkYvPMxOy/oFhR5OQJn5EkFNRyXYNOfpaMMoXreRs8c6t5AwrmgujpL9PBHZZntkzg4
         +UgLKmcNflGVrniCzo7vqg2bH41yy8EDuvHUHRtNmNPd496qAnIiiKHlm1LvoeiD+sfE
         QnhQ==
X-Gm-Message-State: AOJu0YyW8hiOxftxN2S7cIUqipMdcD+61enjNKNRVv+eRaSWW82Qs48V
	WdU3JmEC9c3uijTsW0im7y4NJBLIoxDyNSoccS0rOOjCVdlHv7fty4X14Smtu2CNr1koTtjVCaQ
	4DPRl63k9OEbk6OTEw0krG7R+pCYmrniE70C77zo6wiT1CWtYCluO8YhVj0JSY1VQ7pSL67XTzw
	w/3ntjAZaUMBZtbll024MwDYB9Yc3egZnYtUeR
X-Gm-Gg: ATEYQzx3W3U7spC14OBKoJ22tn5naPgyUPiiL0G2PesN6NtplUxTZEk/JB7xkpfsK8s
	PhdIT6Xo+j3Zqr5KE53s3u1AJ3MmjajFsJCspxrziE+xmRhoFUEhuIH9esPSo5eimHsrgyf0aRk
	1+Etq7DqTsErFJ3xFPbInNqkY7Bp8Qfdk2rKUNLNB75uBkaLRcYJisu8cerWxPLkLwZ0gayqPx3
	7XilQ==
X-Received: by 2002:a17:907:3e15:b0:b87:1eaf:377c with SMTP id a640c23a62f3a-b942df74e2emr636678366b.38.1773052342106;
        Mon, 09 Mar 2026 03:32:22 -0700 (PDT)
X-Received: by 2002:a17:907:3e15:b0:b87:1eaf:377c with SMTP id
 a640c23a62f3a-b942df74e2emr636674466b.38.1773052341472; Mon, 09 Mar 2026
 03:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com> <20260306-clk-scaling-v5-2-d21b84ee6f27@redhat.com>
In-Reply-To: <20260306-clk-scaling-v5-2-d21b84ee6f27@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 9 Mar 2026 06:32:10 -0400
X-Gm-Features: AaiRm525YW9bPGm372anOs0A8j2qVUFhtuo-Huqobjl_XXhjAvocLN1U5bZzXDs
Message-ID: <CABx5tqLFx1_RcvVj9ZRiQpT0gW5xO3sfvxC480kQ8in4BpKmRA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 2/4] clk: test: introduce test suite for sibling
 rate changes on a divider
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 6:23=E2=80=AFPM Brian Masney <bmasney@redhat.com> wr=
ote:
> Introduce a test suite that creates a parent with two divider-only
> children, and add kunit tests that document the current behavior when a
> sibling clk can unknowingly change the rate of another clk. Some boards
> are unknowingly dependent on this behavior, and per discussions at the
> 2025 Linux Plumbers Conference in Tokyo, we can't break the existing
> behavior. So let's add kunit tests with the current behavior so that
> we can be made aware if that functionality changes in the future.
>
> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> Link: https://lpc.events/event/19/contributions/2152/
> Signed-off-by: Brian Masney <bmasney@redhat.com>

If anyone tries to test this, then you'll also need to apply this
series from me that includes units.h in clk-test.c.

https://lore.kernel.org/linux-clk/20260304-clk-docs-v1-0-fee468db99f1@redha=
t.com/

I forgot to mark that as a dependency in b4.

Brian

