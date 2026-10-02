Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3572D23BD02
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954328; cv=none; b=PwEbAHj+O3Q9UBWyf3a+oU4AULEcz69oXls4bfWRElnrM6D3ki69zF2RjenRrdXA7sffTtIZy4pkStI00E+EmajKjfidbfVzqVG7crqGnRJSXhQnwer5qc0vRZRvtaGdn74YmevNl0itBM1xUZuJIaAXS5d+orOy2WQGRWgm1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954328; c=relaxed/simple;
	bh=rfxft130ubu+lypHXPl3SulzpXMvGF8Gkn0UirwH194=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=czK0ydjN8CfLlq2mMo8QnqS2tIjFPBXE3pQVlIek/9uYJDQhrKHA9Jj2Hup7H4bvnwtqpzp8I/BM6R1Zv4hHbkkx6eRkMOaYTQwULxP9y5D2dZqe81iw6FzWQoC8wv1jEHB4sYvviQgSfWtghwp2JeQGX7QYI92lbvjCnygjhwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gn4m9qjU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GcKKXHX+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gn4m9qjU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GcKKXHX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790954326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B5HHSLHQ6EbhKxP++Q4gbaISPGsA/MwNTf6uTPkzsaE=;
	b=gn4m9qjUBzLRUqZlBdgIw3bFdgy7a8BVkL3oL2+CY3jaahbL6umwCyRvbMkH0bnAMfeDWU
	KJCHgoKPPWNLNy5/y+ztEE/kI9bnwXJ+KvaknT1f1MD5ym7qqquOtmLTYiLe9rsv9wfm/q
	ITnzSXMHd7sGCHgoZ9fMih8ECKe9c0o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-vJdXCN6UPWi22swHWQlfzg-1; Fri, 02 Oct 2026 11:18:33 -0400
X-MC-Unique: vJdXCN6UPWi22swHWQlfzg-1
X-Mimecast-MFC-AGG-ID: vJdXCN6UPWi22swHWQlfzg_1790954313
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso323251985a.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790954313; x=1791559113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5HHSLHQ6EbhKxP++Q4gbaISPGsA/MwNTf6uTPkzsaE=;
        b=GcKKXHX+1RbRrV4n9R4mGnwdCZpqkIRDNxuaj07M2VjyXI4cnRl3MKqk+beB1Vp8jD
         BxTzIoRM0oqkHs9GmPmyqtNvkxQJ4nGbe0YlDHMLZ8VdoXON/IPJT3p2IA+Q+n/FKMwX
         rZ2nnuxnQzUdtxUt+/8DOeGtSmBlYuG5fwtKVBjhdB6h1a4q8q6+SHEtDoOh5NpVu7aB
         kIv0NW8xpmXidAzBVUT6UVhdtNvbj6H1FzfJsdVhVDnSHrWar93XDvzUEF+g9MzChgYT
         NdS8in5+gIXKlxLL0f0lhzp13MWnZLzSUpxARQLmW2aizO5qE/q7N9172r6wGl2sIgnQ
         JfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954313; x=1791559113;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5HHSLHQ6EbhKxP++Q4gbaISPGsA/MwNTf6uTPkzsaE=;
        b=szMwJqnzSLeVkTnB7zsFeSPdTFk2Q6yV5Fam+XKJZ+SfZvxheb7Y/wFybz6BaO0v6p
         83Y6WWKFDACSrGIPdzTnFCdiY/eWZpjcpwMwAHobPA/qs3MfS+jHxn02jzXGqzLrRjBK
         NipbqXbg42/GK0UFWMHEsxlB63D49V5OS3W2EjhHpw88zcv/eWfwprZoVdU1+7G51D+3
         WbPDxS8B5iTMgELJR4+lRO4nF2ovbJDR+pLb7S3PKQX77qSujrJLOC5JkpojNRbrD00Q
         weNPl9ueuW0PIb3sRBVh1nm+Kz3X1IuY7qAl4IG54YTBY7f+/FXyPpw4VAeVYkuya2yO
         Yk+w==
X-Gm-Message-State: AFuF++m7qQW3eU1eeyCz7dGJzWqpb84+62+2jXFGqI/v9EgpgyCa0eE+
	sQ6KJppBjTuSciFoaocMsrhlHM0ZBG9PxhqeF7FFmnv+D+p1PuLnIGCb0RkotuJLtBPTJGwPbox
	YFYDiUtfr+ICN35uCWZANpNosytRil4HAG+COJRJomGWYsoZW97n0FKtjx213bQ==
X-Gm-Gg: AYBFou00MuasLBFxjQCX8oqvX6XHTEUN6m3mVoQUNWvYkGLH08FAY+uPeE1/Yr6rNH6
	M78TbFFlXof1S12azyplol1BYzFBlhHc6XYtSoI64P1E6O03QmALe0LuenkjFdN0zU5kxjiZOng
	bP/o/KRf4mWfFnswu3QqIRJPJD9He16zcyVCyCBB7HmZ0XHXqPC0XTDwqyNcrB8qrrntUDrIWBz
	AT7F5S3GdwnybZxMQebHtHeu8bgEjohviKUpggRbSLlzeOb4J4FpDXVUFxXFXALh5JVZ4fodQto
	ZOuZrmZoRzT5m/e6ef2+TmNSizbEIWiZhaIsxkdQzX+XtR3mGKgC/aB+5jfiROqEhfh/jbrtvXd
	zwQcKBitVGVT25kmEsf42XP0yshDp2L4tzVpbMUv2flykHR3Wwlg=
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1167444185a.13.1790954313105;
        Fri, 02 Oct 2026 08:18:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1167438485a.13.1790954312646;
        Fri, 02 Oct 2026 08:18:32 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b682dfsm22236446d6.19.2026.10.02.08.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:18:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261001052343.17966-1-rosenp@gmail.com>
References: <20261001052343.17966-1-rosenp@gmail.com>
Subject: Re: [PATCH] clk: mmp2-audio: add missing PM_CLK dependency
Message-Id: <179095430450.795320.18251776137659753144.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:18:24 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=295; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=8prFuF3c0ZcSADlIJcosM/6C/fhmNlZC3585kHSeKkQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2n3Z1Ej3wYZPrzgPvHjunljL0XOnaf+BtPW9J1v/4C
 rlWmTlfOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhI/B5GhpUiOy/snDNJNjtS
 6KlmH6sVl7/DZd+znxrD9x1cbfbg72ZGhpbbvFyLrU4Fi2xlymJw03IuCazbtHlvIFOi2R6GD2w
 7mQE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 30 Sep 2026 22:23:43 -0700, Rosen Penev wrote:
> clk: mmp2-audio: add missing PM_CLK dependency

Applied, thanks!

[1/1] clk: mmp2-audio: add missing PM_CLK dependency
      commit: c5898623e0df6ae0e97c957183ebacc13a6626e1

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

