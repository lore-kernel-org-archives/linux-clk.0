Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951894734D0
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261123; cv=none; b=DoLv86G17zd8KRc+io3iwJ1pP0KB4qtGurCmTPo3Xl3TO7PUK1KkA5oGMvh42RScQYfkyE5NB/tKg3MdnE/M5mf4euZi2ij72+sXhR8JweOkCX/wCUzPkn2oHzwzRPEViYy+R90DSuOU9f9fleZpaaJIQWNzmcQ+sKeD23i/S7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261123; c=relaxed/simple;
	bh=I0WjaWZlyCjT73mvK6eAJL0c4Q/k/gh1DgLDlEdtyco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tDlrPm7hjmmrXAzNEz03zbHwkVpB6uxHb8kqfP+geF9VVUblriS82Gf0gXWH9tO7HXy6A9MUKxMmZrp8X1vy+vrV9TVAqAM7E6poaM6unGlEe4QwhF6L9zVCZ0NBMZ5UwjTl2ttlPyTkLlo2yis8w2gLh9cdJ4AzVIVYRvAUXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=deklQgiy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=O7msTL4W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="deklQgiy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="O7msTL4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788261120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=;
	b=deklQgiyFcr72fXBi4trKHeUc2/lspvHd4iJIcb1WM0ZxrMe9JPe/4VWb33ZJY4TDxTgCc
	yjUmLXydO/5AQYJfHLvKQ3OmLvkLwGhYYfq30pnz0eag/pkEPSDBGCHvAFiJSZDpQY6LgA
	+cctSOAHyUGqyH2LD4jzVpoPbv3VQSM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-i4jd9TtCOAyIdmU3uM8LoQ-1; Tue, 01 Sept 2026 07:11:57 -0400
X-MC-Unique: i4jd9TtCOAyIdmU3uM8LoQ-1
X-Mimecast-MFC-AGG-ID: i4jd9TtCOAyIdmU3uM8LoQ_1788261116
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so93071385a.3
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788261116; x=1788865916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=;
        b=O7msTL4W1LOKUu2FWkb/oSUp+h3t1N4f+8+HPtAjXVprwQgHsYYTlbnkI4AkAse6J9
         V8WQNMrscM8IQ3T3an9DStP5MUuQhCXxPq0pE70HOy8ehW3Er3jadGj9tjcjo94ZJeiU
         QaYZtJ8BdPvHgAsdQXzxgsuytL4aticjbLG397DZV9D7mxMHWI1njnXnGnY3IgvGEQJW
         cXiUcG4SWMElj46kdHJG7nvQxpEvo76wjbuMNA6d4Ip0LzJUBsSIFF43gYBZDmVbVSOn
         Mb6x3+Vl4PfFalbPi8MVGrVlVc04cU9+Dw+fLMEdT7rc+U2dOsaQ1Rmqasl9Oil6L2Ct
         GfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261116; x=1788865916;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=;
        b=EFHoVwXLpEq6kQRxjJwjAoUKRXm9p6UnrPZVFNNZW4JWAjE+9FpNadiSQCINKFl5sn
         9ObZOsuSUl6BaGIjmS+BLlW6GflzvMQFF+EBEqQHlGZK54qPiAiuFaohEn9/hwxc3wU7
         PKx8SPpnKDa3rkzScrdgneRAsR9+CR0m4pXg1/vidC+dB5Nz9Tr/oZNU6dWgM8XVDbyI
         GjPLx0FwwaqPt0QAv0haLGmziFTd/melyE3+phruyWwvtnOjrwhoCiy3OoGoEAC64A6U
         s3y35kAFY2ctUsXwSxTBkGRlQW52bUh1VFdLNCJEYgrznzBMBMgu07XoxTYVK2U869t5
         nDlg==
X-Gm-Message-State: AFuF++l1ngBLZuxQw8J4VdHMjuaQ+OyWk2uwZEoG3UmPTn5JLvskKkCx
	mCGnSIuZH/eIipzm9CsZOPaQ0rzYRCduD/w5ZaJUq9V6vxQ7GIfOLy1++ZEzuEzI0s3baZbGloh
	tO1T3iNDkY3Nle2s3HTqjgI5lh0XGcyZTtJ8wabOK37d2sltLQ8YsJn9M1nX+IA==
X-Gm-Gg: AR+sD12gERGx9e6tTvuUARtjEsDD8NRiLOZhkpTGqj2PxDLYrBy8zLZOZxJ9LVwJQU7
	JG29a/Ensttf+uOLB5RZkWqM0bPZ09FJuJtd0OQP9Rl+TQAodAnd/LuOhdP22PIKUZCUHukNONr
	PZHRY4oMGs2/3fQ9YBjy+aZzzwSJRNufS5Uv58ENUGq9fHln4Zxen2aXbVjPFCrOJQV6vMcAycW
	pO2kcS78vXJVDJ1DrCmSL7PVed9H9htyq58Ho4j9vs0tolNVi/ZomG4ijlJcvlSnDVLnycGHuWq
	n0jTobirLASAfOf4/DAANRij6kmsiLA0CmstF0n+KuM6nPZXOeiPzZrZmTbBDjDFdvXV2sFk/Uo
	3/fEARW/8GezDi/rYZZwNhL82xAM/x4874JA/EMWT
X-Received: by 2002:a05:620a:6187:b0:934:97c1:ca5c with SMTP id af79cd13be357-939137d09eamr4145044085a.16.1788261116351;
        Tue, 01 Sep 2026 04:11:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:934:97c1:ca5c with SMTP id af79cd13be357-939137d09eamr4145038485a.16.1788261115913;
        Tue, 01 Sep 2026 04:11:55 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a734dsm1005142785a.26.2026.09.01.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:11:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-Id: <178826109921.1923810.15249958200247349694.b4-ty@b4>
Date: Tue, 01 Sep 2026 07:11:39 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=299; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=O3JvY97otagHytxcUyGsTeDj2UPUf0B409ucB+po9zg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKmbfrqJ77ytoHk8SkPfgZsr3zSll1TzPhn29aw5bzHH
 mglSyYWdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR98cM/8znH9/ygXXevcvn
 P6jqxnNVri5atM8i+vHb4Mn/Ap68WrmM4Q9f+R7NJDWJGQXse6/8aI8wZpEyD1xj7hfj236L5Wu
 fOg8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 23 Jul 2026 15:00:51 +0200, Jerome Brunet wrote:
> clk: fix self-consuming provider module pinning

Applied, thanks!

[1/1] clk: fix self-consuming provider module pinning
      commit: 5d334928586b7071bf7b3db19b04a2c0e8f4efe3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

