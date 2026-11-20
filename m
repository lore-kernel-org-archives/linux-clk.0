Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193336;
	b=u0ybha9HtBsC9CSiZqgYCzLXD7bbO3K40R8Pt9qzL4CR/DO4dhHO381fp0JqED4PTWwY
	 zj8xYnTQNwsUT6r8C56VfvTYYo2U0Tb1kbprX1xFzAOAX2MQx/JfWGPprrOwa/Njuy3Qf
	 0hfkOIXoC47+I5bkjIwnSWE+vZCuzq2mdwvfLeSY+UW2YsPMdQk4JcBslaPREeMg1kVeE
	 +4jsNXlyrKypGVT5JJ5H6y7wE25qeB64QElPBqg6/gfBoNfh0RYUIzs75v8EQQsA/qnga
	 JjWE1Le5NCtHn+y6IuhAVELVRmxu5+eR+Px8WYFsczO0sUVFeJlL2pVc5FrL2DMaedQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=h6ErIQcXg/IQfSzNOukoWYAaLWArDLpy/6tOg0mzvho=;
	b=LRS3S4J4RNu1WqgWCaUa5eK9arK3w+oi1dHm35TPZtxdOLvz7SySWE+mG2DXqqaXHkL9
	 bHB1GfhNiSqhDaGRgckSUqmu/zpxQYru7yPDdNmscITtrP3XcNghz9oU1ReS0AlxY1g+0
	 /jxEBU1EKGT/JrfHHEwu+cTsO2eKNMgP+fB+xsio+6ogIRtD0MB2uSROySMsozNh22JcS
	 UF16S4FKKoIWHNjhSClSeyuKsPZNBDsFkug5xiA0UxK8im19DV2WkvL4PEKOzChVYGmpv
	 udkL6Un6Nn9ZoSGu37UfOIFNiwtlRrYW77q9yesVV285JniI3j66YEHl+gRXQIKGBKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ThqzXs9e;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E0606A336
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 16:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88E0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ThqzXs9e
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1037248f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795193334; x=1795798134; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h6ErIQcXg/IQfSzNOukoWYAaLWArDLpy/6tOg0mzvho=;
        b=ThqzXs9ebiZGDM31gPGl6udrq/rds0mEtWQp5ii2kuizKVYwjIt1mRHIaBc6Fzz0d2
         gZA+3ggV2soL3PWUUsf4dGrZlqtGT3N8dW9S0rzOvNQN+sX7aPjYnnjG8vMoBzwfpOwz
         tGsIJXI43jmP1C3DUXG6T02SB7eruboytZi8alvfqyxGspyzlXpROvgdj6SReMSKJXLK
         kDHyIrCBfTy88WmXKjhS4HGD4CbC9N1lhIR5d7S7XuHHH+BaFEQY+gThdDukbyRKw4qQ
         /zWnhCNKVVlyZbltXIvRV9hF2hZzKltNgnSRMcwh1bP3tRso+GxfXCMD6VYbl97yZMt/
         Dyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193334; x=1795798134;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6ErIQcXg/IQfSzNOukoWYAaLWArDLpy/6tOg0mzvho=;
        b=zdecMw+H/muoxLoNjnS5ybrfrOwP7zYnN+Octnd3Xhtxre/ssybezUa6T5LBSR3j6S
         umwNhgI5nFZ8eonFptADxSQNL2P+Vh1udjyA/M59lFS51JfHcMTAldpDNj/38ICBc4P4
         e6foJVRiHjZnnVS9egbYgl+5c/k+0y0C2BJ3U8y+tYvnOf3A/+gVwIEQE/NNpDrE8m0i
         O08F24ZySZbCTlRpeWkiHJtHG4I4Q13iazkSOjra/GT88YDPHULK8dVy0U6rW08GLS7d
         EiR1LSEIh4WnLwk9C3Ff6ZD5ZiU4wvO8UZem+xLF5nHPfJNfVWNorJNrvKN4TzIXCXN5
         o0NA==
X-Forwarded-Encrypted: i=1; AL+hErGKzcKYRs+8/AYuj3JcrrbMOf0G+O64TETODbUicskW1Zkcplll+u8AlqydZ9TeGZ/h9nAZRk7Uqlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vysUuF2WyrXz/ZZvbFV41NLx12AvH4LTKSoCplMZFMaJmqqMf
	kcaFjxe2/CxHQ3gfiKHT7kD2/7smRdBmnEajUk2WQar1UZlNTd3Rim3Sje8i4z6bhJ8=
X-Gm-Gg: AZFdTZd2wY8I/vLvXBA2MEdMoPVZLLPVV6NjSe/BUtVA8SPBuA5pAnnHMcLYriRXhqy
	mLqAUbfCdgVqG3fmn2XmHqxGffDiUlLIa+qE9Q491FLEyzHrMnOp2VUuwPBz/ieZVMPk8LbCS4L
	z92K6ByY34h/GX3DJ5jT2U79x1ALfoTI+/whZy7/syFFe2vO2S8o/IRqQzZTovnA3GkEZdfoMUz
	oG5L4X60jWBrg+i6SsmhE69AWpwYLL0EU3IVlu/sQiFdLoScnVN/OEuxcK3HgaY2RuU+BxvMveE
	I3QKXJS3Epa5X12b79xEULMRRNsXNzM0XvJgOkSMkP/NUd4ZAuJ+7rZBUjx0PfodcsE9x/XaJaU
	VjqRzNo/HMBqJbKxZr0ePU5khf4CP7E10RCM+tG8If5Q4EXaTjmg4NdyIMcVCEPEiP7ye4bs5PR
	y4/pOv4y9LL8GM5QU5BRkLl+rcQoTxCp/lgZrNn1snsTL9Wdw+GBaqOJsUZEzkN47snaCtKap7v
	YA2mX5fVvGdDIN+rrJLmxTSvddavnrcZa2inaJyuSmO4fDeIWw0N3mUMNGPvGQaBV/w79H1xoVo
	Lv2McBnaoCqk1SkgR8Nlh9pCj5B1cQWGw3XhpoWEbGul8mSV
X-Received: by 2002:a05:6000:2c0e:b0:48c:58d5:30fb with SMTP id ffacd0b85a97d-4abad5ac62emr8227901f8f.5.1795193333959;
        Fri, 20 Nov 2026 08:48:53 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm6034212f8f.34.2026.11.20.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:48:53 -0800 (PST)
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
Subject: Re: [PATCH v6 3/7] rust: clk: use the type-state pattern
From: Jerome Brunet <jbrunet@baylibre.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Maurice Hieronymus <mhi@mailbox.org>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
Date: Fri, 20 Nov 2026 17:48:51 +0100
Message-Id: <179519333138.3795820.61438010297111723.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vYLwHzMkZLjjbU0w6/Ec7PCJHgruiB342xDmGbUK7jQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMlV+EGpr8GpuXL66eHBu5Y3mWWeFV4a/G+0oUxUrer
 RUIcefpKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwETm3mJk+BtiEpjsotk54bty
 cAsHW8fEZPaiNRy3p1XOeRy6T/PLD0aGzfPKGdIZvNz7xBo2Ljp/6Q+/laCNSwnzT95L3nMcLF+
 wAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The current Clk abstraction can still be improved on the following issues:
> 
> a) It only keeps track of a count to clk_get(), which means that users have
> to manually call disable() and unprepare(), or a variation of those, like
> disable_unprepare().
> 
> b) It allows repeated calls to prepare() or enable(), but it keeps no track
> of how often these were called, i.e., it's currently legal to write the
> following:
> 
> clk.prepare();
> clk.prepare();
> clk.enable();
> clk.enable();

This particular sequence is indeed allowed in C. I don't get why it should not
be ? (in general and/or in rust)

If you dis-allow this in rust, the 2 sides drift apart, don't they ?
I mean they start behaving differently. I suppose this is not something
desirable ?

> 
> And nothing gets undone on drop().
> 
> c) It does not let a user express the state of the clk through the
> type system. For example, there is currently no way to encode that a Clk is
> enabled via the type system alone.
> 
> Following the Regulator abstraction, switch this abstraction to use the
> type-state pattern instead. It solves both a) and b) by establishing a
> number of states and the valid ways to transition between them. It also
> automatically undoes any call to clk_get(), clk_prepare() and clk_enable()
> as applicable on drop(), so users do not have to do anything special
> before Clk goes out of scope.

So the point the is automatically clean-up (as in disable()) clock when they
go out of scope ? In C, the equivalent would be calling clk_put() with a non
NULL enable/prepare count. We do complain loudly when this happen. I don't
people should encouraged to not actively care for this.

-- 
Jerome

