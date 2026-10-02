Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342493F327C
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955991; cv=none; b=AUEUY61S0p17jxEPlizhsArb9DAAaOj/YBPirRWX/fWGYCgz/aC1YyJjZui/qDlcdLkq9lNxdVZ7e6vzJ17FWoDj3gn9m7GvxNBmkorpbVnlZ3LXX+WkVyMQCGoaEXAf1JYKqx0DHW3XWo9SFusaIFyQoffXmAcCH72XEdsXAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955991; c=relaxed/simple;
	bh=h28xSIp17OKs/AgiIrNq+DdSPKZiP/ZhWr17OJaw6v0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iXz1aePJ/RXQyWoTen7/cs8GfWO0RqXf7SkiptJ1da8nWiUI6rVLF8mpVioIAFQKvHE76yLZ5tOX5ckNsPE1L2hzqpjzYVa2iuaf2kmag8Vf5ia6TtGYHRFhScZuSZIdoHJXfFaP7Qh2tJHfnZJEaStuZUnwIwF/wSdmqpgyFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=boSRXA0u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eopCkTTT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="boSRXA0u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eopCkTTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790955989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
	b=boSRXA0uww2VevY/aVLg9v4AFUOOzUCGmolfLvfnq+FOJrGXiTQXexejCYMSHKsAFJsGmn
	XDooiy1VP08H2BzSSb5BmCVuWx6dez890OkGDwbHhxv6CQb2r94iwiD85F48MMpiQHKc/7
	gesjC/rcFrriTGYnv+ef0oxGCy+d+18=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-yIKK2yfNPvSIUB1fCCwfTA-1; Fri, 02 Oct 2026 11:46:27 -0400
X-MC-Unique: yIKK2yfNPvSIUB1fCCwfTA-1
X-Mimecast-MFC-AGG-ID: yIKK2yfNPvSIUB1fCCwfTA_1790955987
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb71b1443so448099885a.2
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790955987; x=1791560787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
        b=eopCkTTTIgHgygBF57ZjL8jbqnAWngZ5pqqHQ5zV356I7kTlMUzwLDF+KIlr6lQqpc
         6V3/ndlGDkbs5YDeOWZQ/FR2cTV3pKDdUatOXUIYUrgBOsSwOOlVW7CuW6cuvIrWRexP
         XJSG+AR3eKWRVOuniShBV/SnRlBfrADRNxKY/bu3J1c9DF+H8mDSXXpYGt6WSRwIkfWd
         pCsKf2oE2gYbKstCqM5zwLIywg1iBnxDtWiwEf6RbcUt8/xPAbd62Hn04bNaVLGnzy8P
         rdgUxd4tKKSpLhvr0ATRVvKzZjpQGpJUEI79pqENg5i3veVKpke+oxA251flaXSgysrP
         P+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955987; x=1791560787;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dkAUcAmviJBE+AfFgIHguRjot4BcqQHezlPnJllPFWc=;
        b=VFjAGiPTFuSIH11chRPZtvN/RFAokeeF0nE9DriCNd4lL6HN6I/j0kFsiklKJYRHII
         ++3QIgVkSFjsX4EIwy3pUJYjeoTFcx7pzTmiEYoK3m8G4OqEOkwrzVNFStGoOxnGsnEq
         MF/0rUa7KW6geJfuD/dCcotNlcQegqn5mES/rpnNF21Eap/qMiLweXGBAwnOPkGg7JQ3
         r+H7OixF9VzB/7cBL3niptUd6hlXP0tJHLYpB64Nn1yRZF/ltD/2/LRQbb2Q8I6WqOJm
         XhimRJk+Oagfjgk7PdV9x35BtSrrdg310C8rqvo6zUFqNVVohk+gdAKiQ/0zaC1PeaZe
         kM6g==
X-Gm-Message-State: AFuF++nGBibc31Oa2oV7DsEh6IscOW10rmjmYyypRBy8Vpawj2b/dMxn
	blQFIoXeB0HGg4oj2rTYnC4l+3DFb+hW8dvlszL5DLr3SXeNeP1JGYLWcaX/Ft3iwbew6HS/duB
	/PPgC1fCGTfRKwZHum+vvXbeB0XY79jbxRrCRsct6B0UlTDmMnKX3Gmzqkev8nw==
X-Gm-Gg: AYBFou0KXFGOFeYvaSBpoADszulJyE9NgNhXy6pjJ1R/ZF1siS7ym5gDFlbd0CbCJmy
	qntAvQIrYUv8N8ZEu8Ug1pt12m5vc+xJqgxVRSGws8s8tDw9a/E//dfJaaU/i1qmmaJZuHfpc9J
	zcYX1xCCeqKAyYjZb9akQBolIojWNioio9jJBGt9m2OLQqpI5OImjgiRhHe/NE31S27n9S6P/Fr
	0Vtrz2vZ3KbFJ+vjg3SrhssuA1przD7ivpNSPy4H+skWBmJMYOmYbhrA+OQqLptFW+H6wUeHWrJ
	T+lnG0MW6EoUxwMYGvyCOb8VenMooxlsO5BUv+llrQop3J7F7cNrpq6nAbI8yMautH6OZ1kZK+y
	EjK2Gy4VrLBs1f8ihKx9K3DncCde3F8GBbk8MEGdAQnUuQf0338w=
X-Received: by 2002:a05:620a:1a13:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93cf178a238mr541163385a.48.1790955987066;
        Fri, 02 Oct 2026 08:46:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:93c:c98d:e1b6 with SMTP id af79cd13be357-93cf178a238mr541159185a.48.1790955986487;
        Fri, 02 Oct 2026 08:46:26 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca209601sm250629285a.20.2026.10.02.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:46:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20261001054701.39160-1-rosenp@gmail.com>
References: <20261001054701.39160-1-rosenp@gmail.com>
Subject: Re: [PATCH v2] clk: tegra: bpmp: remove kcalloc
Message-Id: <179095597991.810253.6056329084530494982.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:46:19 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=267; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=p9s0POduzL50uWCzmc8L//0zD1FZFy8osEfnLmwPpCE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2X7xwlD3q0Mk3N81nbOcpuVDJ4shx5VqkofuNK0t8q
 5zkd/vXd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRac0M/7NLc2IttmQFTU5a
 uPWu9kv/HRz/0lkjLru9WDHz87aLs/4xMlwpS5q7a8bS/AVXHn6vDbqh6rXRLriQfRnnxPz6rHz
 lB4wA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 30 Sep 2026 22:47:01 -0700, Rosen Penev wrote:
> clk: tegra: bpmp: remove kcalloc

Applied, thanks!

[1/1] clk: tegra: bpmp: remove kcalloc
      commit: 2fdfb2abce2fcc157de840949fa3e6af9e915363

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

