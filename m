Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632832;
	b=SNcR46gceKHuxPqXa5D8CSD/GDXR/vV9LsZCF6VvN9ETACuqZhyzAKXf5UOrwCis7StR
	 ttZ7KRiGa/OQ6JRF9EBoowmPOr9j+5U+JycYWDPeL87ASW3iMEy37rlEksCNaN246SHuG
	 i1zqZBI/37jh/Nlp5hsZktYtTLYA0VOoJJTioL0f051Djx9wVE8gNnfj9JoPgxGT9B5+X
	 MIjaHBCOkdVSL3Jd3mEAArJE/gCjDX3IKuERhe+Yk4RAaT2GsGj2sU6qb/NfCLY9bjyIu
	 B9R3fkJ+COMQ6Kmk0jWFhqMZVC4c7J0lod2S8VoAnS7RZfsFE2jFOzuN9BRDleI8X/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=BQALLwi0qC/ypIHZdKWUL5go/NoZZDPjZJr6kBd8GzE=;
	b=yoCZVhM1lXugxrj3h8T2WbWjlrsx6f/P4KoqdzykFnEaB30XcuS1f1/UiazwMscD8CU1
	 8tzMqKjkLVQTTemD7tITA7IOL5YZu5Lbak5saaGxXeo+pXJyfHg7ANwnivzlmO/ra0lh1
	 fzOsbrBx10y4UxFIaZcKymfjafAIbYvAn09s4Grs/6HgLKXSa/ezlhWhzIn4BTdnE8cmG
	 /0rZ3ccLxOKzwhccOFd+Cq3R616CR03zIB2Qu2LGAoiq6j4aiOZiixcmeQwCS0QiK5d6J
	 RlNLnpQSgFpVXZfmQQgqQorHFfbCwkpEbsZ36xVgTF3pgAil0OxTd1Wr2L99xX36RKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ch6XNIY3;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA460C15B9
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 15:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DA460C15B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ch6XNIY3
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so25479605e9.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 07:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632830; x=1794237630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQALLwi0qC/ypIHZdKWUL5go/NoZZDPjZJr6kBd8GzE=;
        b=ch6XNIY3t6kF0pn9mtnGdyb7ik7pSmCyuebPty+fORrwuFfgVJJBcLf9A1rFnrR7ey
         eXDnX/pJYkVl9R9EwGMTqsCSFSlaxGDejoqtbK3VcDawlryi1ivKRLG+N7vWM5Llzdui
         Gn7PukEFyxcHYL+9FYwdjqnzO2SbBU9Jsd0su06Cz6mKZ3FsWiLxd3G0x+TeE714QsET
         UrGYM2rCj1IPa+pLmkNhp6sq3rjLi2fcCjgA0oo1hEcfaPTajHbBROaKaL4BHWbjchh/
         PARzTLmSSzaXz9Ag1zDD17FsvyDTCHAjToe4jl09oE8qNfcgwkhbzBrgC6//jx8W0mKx
         pOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632830; x=1794237630;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQALLwi0qC/ypIHZdKWUL5go/NoZZDPjZJr6kBd8GzE=;
        b=zNfbIEjsOc0YCE3V3LYBJ/Oy5EXRUpiTAgbv+v+fQS7tvWfhKYOX27MdwTpCvLYRfG
         54hZiZrMSa2aX0wjRtiNP9knr1n5xnjVuihq3CnZnynjRqHHLvndggS/0PbUpPvLJyiS
         DK8op0xoFcuJCoMrYc/rtVJhhYfmucJaCzORYX8PE+fLb7vVGhjUAHAj5XOrTbWGGGMQ
         5K4U5Piz96AH+Bovpg0M3gIwQcAQuTLXl7/mKvg88O2zjpWAzawF4i4PrXmcvpM8C8LR
         bsi93koTI/smovLQOisjj77ADloGT9cDpq7/rC60lpEDqmTikfgfo939Ldr7ouVYFaXi
         FxQA==
X-Gm-Message-State: AFq9FYLpXrb4AR3qhgbypF6sbtR7lEOnsDdXopPxCRxQ2SxybNgr3asu
	WDTXisoLVaOY+b686L5LdUWYZN97WdDTtBTQqDcMTefM5O7zCcX8mpuDvsRvEJGW0QY=
X-Gm-Gg: AYBFou2qIDrrBcaISpN7BCUCP2NH6GEOZpA2dNpQHfLjyBd2bAOx+yeE9CcIQSnnlKS
	42LXng+ZPo7gX5nu8aDpzkwkfb7pHewgu8ydTBYN3MIv+wN0fbTIjJh4pq8gNKymT41A65ZZnj5
	zrco4OniqsEMQ2x0Zhr4RQw4yOx4VMK5CHfGoKxIoqZ5yATeN68CkK8SNUelWI3ouG1fsxdhy0x
	sEZsQ+K0MhueFqQeU+C95bVb7LqJ76YZFsldZpmXKwXNqXfr3T+GnvWrrwFRLfOxJXtwRUKnmKN
	KHgfL57lKtHjKT8x3ye7O/WSy/hX1cZ3wqhwl9HrZO05gBxDDejGrGL4AK6x/0ZACAvqB59CPRF
	P5Kc++shd2NxjnjxpCrXLMQ1JK62VpFYGDDdxy3h44uGf706prii6/QSH3MAv6IQi38AsIwOtJy
	MzSOqPrYX7KXYtPG+cWbUvxM6CtzY+Q0rNo1v286qhJxVgOFs36NZtnVAN0QroDIed08lUnnzkh
	+ANz+vBEbMqV6taTtlq5WhCiwGpagZD1MWNwU2gS60vd0BErw1LzpbjvIoC7YEbNtT9PjCGI+7a
	yltk518eiUub4I7alcXecEtBdEzk7v4nCzDJeZ+X9F5inaksnmvlYFhxb7xm8ENaYjxAQg==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr235421355e9.18.1793632829929;
        Mon, 02 Nov 2026 07:20:29 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm127731715e9.0.2026.11.02.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:20:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
References: <20261018063009.1365568-1-pocj8ur4in@gmail.com>
Subject: Re: [PATCH] clk: devres: Skip cleanup action for absent optional
 clocks
Message-Id: <179363282435.2870673.13424521075621537004.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:20:24 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=199; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Yxcb0uqpdb4B4EpHRgmjN44BopM8a/VqE6zF93LxON8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVtmcrnilenNPtUrq9YX6Afvi24K9puZLbTx09eKaX
 xO37HU42VHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJXIpkZJgXGfP2t9nCcP7p
 gj0+X/T/Ju1XZjkrVKMouui9xrZfMzYxMix3Szf5Fqg75c7a4/5Fzp+K1q4wn/xEzady/n2laxO
 jk3kB
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-pile), thanks!

[1/1] clk: devres: Skip cleanup action for absent optional clocks
      https://git.kernel.org/clk/linux/c/8c30b4bf0868

Best regards,
--
Jerome

