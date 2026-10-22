Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693317;
	b=m2AGRB/MkPytZi86yXJCM58g6pniE793zJZkESLdEn5qyBEDa+0WGrxqXbu/dEgnaCby
	 0mCN/9rP/mr0K6HdplNR/1Ng50V+BTru1qQO6a4zmCLxKQY4QO2F6kFNMPmvuL/fSz/d/
	 IcbCIt/c+6fO3xvh9Vt8oKvOMVkj/ilPY2V+8+cHcfjidBocZvVFN0wD9VVeVNjORI1W+
	 1GTbvcuhhF4s+l3+7X4XcUMSjv590YH9yikHoP2a8hp+AUBxnpAqWmP8/fAkWiYyIyxlD
	 Pte4VcLz8W3GVBzs/KmuwTEsTbt+bqMjnxaIBHihDIALb9wu4IvrDx5tY761xJcuc2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bQE0lagaKaRPxOL0ymbiA3jEEX5u6DV2i4c9cRwYEcE=;
	b=3NKuRYd05c8KrF/vBuo7ezsM5GFnNI8iz4u6Z0CFhTx0PnaCjMjJdeMkl8/CYvcSuHmW
	 UjJchZ+oSc1JAX/CadWZZE/PulD9VNiUkjMHeXqTSq0qgp8vux8ld9jtGAIn8IyToZVpp
	 R5ncANoLZIb96+QLmskv+Xq6ekWmwaW9qHZZn/QynLjz3V0YVBzsN28kg9ijum9/sjlvp
	 d8mqScxzUQkxlvSdtvGaRtGG00p9FH88+RO/Ww3nuomuAHpILmhq8Pvm24Sfa1hZKHV0G
	 XNjGm02u2TnUBejYxf++gCkvxtqcngJ0nBdeqI2l/IgGmxEVj7BTeYhSHpRc0kWodiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=neKW2akp;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD3606A319
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 18:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86AD3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=neKW2akp
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so65728f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 11:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693314; x=1793298114; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bQE0lagaKaRPxOL0ymbiA3jEEX5u6DV2i4c9cRwYEcE=;
        b=neKW2akp4bDqZqrooArGXRxYDR5szIWCWU2hQc7KQK5dNxh4Onj9VjkPBRMiVog/ND
         pqT50n+G9pucH0Wh1LNZR4qBIgeiyZWQQLDtlDytUM4+3tHW5qqqW2jb8baAYQn6SnvQ
         7gZVjnUrsn+AhZap06o8cebi3L62pZw2CF4zTL9OZIpTISbsLsgPTPzhcsodXNJWHEQ1
         lghlIreZw/DAToLPLg3GoB0YJJBaqOzZj9WDiC60O9ZiXVGErzjZ1CCFUQWiUL3Oo2JX
         T9KBpbxFf9pxRRcFoEx9vxJ+26cH9c7IE7d7pBtDo0QYP0r7CYeZXUQfRa8RJuSIybFH
         QW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693314; x=1793298114;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQE0lagaKaRPxOL0ymbiA3jEEX5u6DV2i4c9cRwYEcE=;
        b=i8QAzH26qCCbWfT9FTqgODoYRWmI2aHUp7vF6fhPLyRBTWWRgcQsIKs8Up4rQ22Hrj
         LGXAs8n+DZKo5caQ7WIByTY2zR1vfzNfFlYBmorKsYaZP9kvRzH0Vu3wUNeEG2otTqH1
         FFp5Vq69VaG4iTX7SFKoIql3U/se8cgt5hYH+lEaaau/JxHLvo1hA9nFrwAgB3HxPfph
         rF2A5THFYi2lMtPKqifKj2+nyNEvqqcLVOm3leSZTLR2ay+LtCn0GHw4TQWT2IwHiROd
         lF7lFfjPwSy2C8D9FACi4CpeJB+gZfKrYLISar5g/Wt8mNV9NyxSzrprjRoaJWG1/hwV
         ZRkw==
X-Forwarded-Encrypted: i=1; AKwUvBxQUn0h9oVaxO9YfrGfIHc+DFopcLYslO9vDHQsNPhKuZ01hDpqmdOEBj035qeQJsOHYxbvE24gJu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4+zpiq6Axx43zJ1hhY+Nj/AFF35Ua9QnTK8rWxAbMcWlBbn6+
	IMt5QWKtIIqA/qVyCF2GU27zeoYNPM8XCddOGfNOP9wWmlAJiGi3E49qlQZF3/qB+oo=
X-Gm-Gg: AYBFou0DC0A+Upk6nUBYNemmQg0xc5Z20TQgBUBP2us3jcb2RZV/XfMl2GYCcxLUJNY
	6EyiaQOl6/x5UqqJp+zngkjJLPYHJ01+7GXw93C/c3tmBqcmNaCLypshUFXPdi44geSvOdQyNeB
	GQtHzfQGV23CskGbFSW2dGZXjq8NO8JknxQ9pVg6ytFKvw8vMnKJkK0wcve3HigONwzdlxv4k9/
	YK2H+fnPcjkl1GCL47RB9rDWeVlMN3QI628Y92d4ZaeaQrc3cKnpj0N6zYwYqDber84TuRYWzab
	d1UYGvpS/lUUDLcSHI/ybhOB5ac+OoRNcX1y9tB6fUsW963slMK5DPmFgcI+JXfJEMoLsNAZAGZ
	MwJ9QqXaDfHgs2QF4BsYxwYU1oaR5+75+mFZDYEa4gcKXitljY7vNM/6LDsN6+NlhPWT7wOyRwe
	Ahxofmqe285ihbuJAARtoy1RsFGkbSjnZdZ7fOQSNWnplLl4qh3KW9tu9fnnaeO7/L2M5jDGTYh
	jNAvj3UwcyBan9RAknfjId5f5XvtXJ8xXFoYqgGv+MEAOy0tFuoY6T6yzE48TN6r9jEpEkOnEk=
X-Received: by 2002:a05:6000:401f:b0:48b:68:594a with SMTP id ffacd0b85a97d-48e264a328dmr12950455f8f.12.1792693313834;
        Thu, 22 Oct 2026 11:21:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e379cf680sm10654f8f.20.2026.10.22.11.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:21:53 -0700 (PDT)
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
Subject: Re: [PATCH] MAINTAINERS: cover all the headers in ARM/Amlogic
 Meson SoC CLOCK FRAMEWORK
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
References: <20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com>
Date: Thu, 22 Oct 2026 20:21:46 +0200
Message-Id: <179269330668.4070168.14282043797701140302.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=600; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=FHA0UZKs4ozL3194RgoWCh9aYKr2i6a1lCUCq4oBDkE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3QhzWOBQZXriX7Ht+SVZ0w74cw10ndyeHsz2zKu5as
 fFW9O60jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkyx5GhgWGYu7+x3JF1PfO
 /nCPJ0JCaSGTRt3uzHnByRxfJx05fYnhf0xUcsuTE1qzk6PWPpon7p79Z+avy3UzZyx/+/djhVH
 0ESYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Thu, 22 Oct 2026 17:57:26 +0200, Carlo Caione <ccaione@baylibre.com> wrote:
> The ARM/Amlogic Meson SoC CLOCK FRAMEWORK section was written when the
> GXBB and Meson8 headers were the only clock headers, and only the A1
> ones were added to it since. The headers of the AXG, G12A, A9, C3, S4
> and T7 clock controllers in include/dt-bindings/clock/ are not covered,
> so ./scripts/get_maintainer.pl does not return this section for them.
> 
> Match every amlogic,* clock header, and the axg* and g12a* ones.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

