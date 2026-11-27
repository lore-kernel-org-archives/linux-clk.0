Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790283;
	b=k/9YjZTgxYFLxzlFFP+Wngf4tiB/7wqOZSt/nRFdpdxHiUCyP0BdhmBhm3AxjFVIBaGV
	 5eTINTSh3JgqS4Sie2WSNveTsTAm29EeT0m1wpG6b974UC0hmS1W0+sMYTm5MlfMVLi4d
	 iK2E/W5hnRGrZZWA4GGLxAlD2YCbFaUSxcqqINIFs7/wSTRmstRwo13UFMP8SmyEVLsVm
	 VrCsFFOrQQjWtUjhPemMqYrOaegeso+a4FAmlmqDEzsze8LEIy7KvL6XvS7B1vn0LU7zo
	 OcUkujXAn8mtfXGnHhVe3Y4SgsTP7PPnd6acudZL4X3uBDMWw3cSQsuuaOJb2vZzddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ak9btoKvCTu9rSZ5ihFwJ6IGdjrz6GkJZ1ClTIBPTY0=;
	b=tG66JLhLouUvHhSxoVtIKmq8qxTsp0WCVl8hJLQ/wu/C39kPZjjyI9lBwby4lZw6BuhL
	 Ed/cu9TMlDM7SQSOg5E1NbAebBfY5umgxYiovenn5Q8GiQw+kQVcsgnekrZxAyH/TmL25
	 NSisVsx9l8ed37+45i4Gj9i/38HtFAl0FHttXOwHJXqJxtCRDNRUpbxJZh5BjHcv/+xf3
	 TPJ6Bf4VS/Zvmn6nBU6B+zcddIe49vYskvCpNJ3d/7FFtLpGkOnhnJ1uIriUrgfSsAyKi
	 1CLtKxXMCGD+sybOAgQVom3rrlaRU7VCGkhIuUcIhMhnMhr2YpUPfy5XajTENEHdyTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V4WKbwUk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A4606BA95
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 14:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475A4606BA95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V4WKbwUk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so66907595e9.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 06:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795790282; x=1796395082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ak9btoKvCTu9rSZ5ihFwJ6IGdjrz6GkJZ1ClTIBPTY0=;
        b=V4WKbwUk6XKF50bdPPfvuoEfaX8vaN7h4O9lQCGdoop/etfJo3VY7ax4y4sY7VKVAB
         CZ1dZR3pGKlNmD5qzkmpIRfdPbyqNUL4YpeV1Lx4agawNQHQxzGKPNfwS2K1f/BK6iEx
         UjZdVD8VsH4I4Jw/a4OfAXewO5YkZ8DGefnsJq8RGw95GpS3rqnL9wLBn1A8PY94EYIG
         vo5T32ZHKsWoubaWF7eZ/RE9na5w1d04XMiMvbU3wyO1PPDSzAe6YK3Ub/diBRFi7B/G
         DG+JYdu5GQ/ki934i+5xT6pl0MUKvhCJj1Uu/22Fu62RJDJ2UdzPU7PZ8qn+I0nS8kD2
         2gHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790282; x=1796395082;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ak9btoKvCTu9rSZ5ihFwJ6IGdjrz6GkJZ1ClTIBPTY0=;
        b=NeGOk2YBrWCl7BzLyCaiLWUco1bZxeqDby7l4wAinKVC/e07waCExkvA2RuWtfrVt0
         j/3+bLt/Zl3Dsu5qWo/giuozLXaPZ6LXY7+PZke4cLPzqrvZ7TzyBVL8jLkkfbUyBBVJ
         HWVMOO0zvCxCDxbl7PNXa4JtcMNZZ+mMYEn2G3unk5ozyrzejIDo6qTl0iSR+6KShP+5
         N5p8xe5WIhw9dE46175n52Pjq19PiyhRLAM5TwD3v15/oesvqal8NvMionmEqhXw4Ehm
         aGiqCrRdNdUQC3QtWkHJrkqOZmwTzTX1MKNEKXtnwcT1rXZtCrpUuTJYAxFucyC+Gjn0
         Rhsw==
X-Gm-Message-State: APuU4Z+a71LRJlEB8Y8TinfTXQnXQH5kcn03bXXPyKhj26SrLVfATL9v
	4SFjFDjQv87a7Rie9jt6P8N/Ui5qMJdJnJaBYFIkknqzSAZLbfeK0+W77GKpCWSQmdM=
X-Gm-Gg: AZFdTZfhlHxCY7AKK6J/w9kqHH0jHK0+v4sx6JEQ7sOLNdWjPb8tSNu5GBUE2aBHGm0
	A1waXijCrvwqHBKqaXYpBadimk4nXpoRzhUXwTyLucn0FYHuPRVxn8eiNxznvzvj8YINll0Y+y9
	nM8r1psWxpiX2rdKqZ/wJI576ryoiqtgBk92e+aZaQz+GijxMxYaHPp3qHnn3i7PEhpDAToQ+rN
	rGZRHgZvfFOU9huse/2ZLFMm6kDbvB0GCxlN+DhrMam0tdiw16luA/RzefDy6hUfElngyPuel4k
	jueWoaZXHmTbYtHwS3qx9EjSMg8TR5L+mn/fIjAonte7ok5FoyUF61XVYyVkC7aK8Y2SSkzgYWm
	EDcH0q/WjtSiwyGXHnFE/lIo4HPaBQuw/Lrfq7PRR+dTwzXM92D4w0xEZhuWi9Op3uru/TP0x4l
	SxsFLKEb9zoUnR0pRmxv95gmPayvfe0nsfTv7lM5MHeI/GNMzNtAn7DaclG6PziG47zFu273Iuu
	QWDgAQhjWhYEVMThRl29IJvqF09n8AdA3z86+GUU/uri/gfZ+Pn2+U/XCtj8L1qjnxaIRD0t2S2
	c8Ki4lkiQ/PRZwVkkeg0JCjo+9BA5bM1jrTRlljHGodleW9w
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr544746205e9.9.1795790281075;
        Fri, 27 Nov 2026 06:38:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm419542555e9.2.2026.11.27.06.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:38:00 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>, Adam Ford <aford173@gmail.com>, 
 Maarten Zanders <maarten@zanders.be>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261127-vc5-6975-dbl-v2-0-5a05581902c1@zanders.be>
References: <20261127-vc5-6975-dbl-v2-0-5a05581902c1@zanders.be>
Subject: Re: [PATCH v2 0/2] clk: vc5: Enable PFD frequency doubler for
 VersaClock 6E
Message-Id: <179579027496.2788166.14775637168016686741.b4-ty@b4>
Date: Fri, 27 Nov 2026 15:37:54 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=307; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fXRDzVXdeqNjLpM8kAgxXB8K0CijXAk5Qps7nA0KRCc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcU49b+AoUhCT7VF6+/nci38OeBtNgvZLur0/VLpbM3
 p16am1cRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZyuISR4XbyJofv5xfN+r27
 453nRdX17JnCTLlMLC+9qtw55nOcK2P4p6p8Yvaino8zXgv++7yi8v32j7YODqfjdq8ocTNI8Gw
 9zgMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-pile), thanks!

[1/2] clk: vc5: Enable PFD frequency doubler for 5P49V6965
      https://git.kernel.org/clk/linux/c/94cff4fea1c1
[2/2] clk: vc5: Enable PFD frequency doubler for 5P49V6975
      https://git.kernel.org/clk/linux/c/ab7a5a9007f5

Best regards,
--
Jerome

