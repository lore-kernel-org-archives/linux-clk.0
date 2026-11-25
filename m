Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606013;
	b=nEqoJjP9BYi2EIUT9Yn1loNDqugFfxpLSHrx3U0WZMCEYrqDb4/ZA0V1KGmJlrYFSDY6
	 8NUegwP2qBK5/FJQ3hgK/uHJIuI2SmJKEmheK3rlFxRGFFZVF8D4I/QReYsWkqbBuU0YA
	 Gev2F5+faBntKIn3J0bTUPxANxd4lf8H99FTsXvLA4sZfqffcDW34KkkRMmKUySpLxzx3
	 PRSNNt6tW850TaAToPnbK91xsGiQgB3yArjFKDTz7Jjkm4iA80IPxCzkMlAko+xLXB3Or
	 sfltQK3PGFODqod7RXl+GnUK/bYHLGtm3r7/rvFekTkrc3XA2FMKTCri3TBss/dVvrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
	b=mYnzSIzDlOA2bNTw0rw4QaVw+ziD8KP8RBbY7VqJCmBMWsPTVitBk87dRLESDBDalyq1
	 WGYWV7JHmx0/yBHFS1hpHxCA5jQOPaMXLy+eU47rfhmzONgb5dRrqP9oKEVIKSww29/M0
	 LPtqOFB9COe07sNMCFQhlqYNm74wFZOWIDdinL4AU5UCyC7PsvDm70RCWW7iRkUPY4BRd
	 lZhqIn/H0GWo2Y0gRZhDr4BVVioB26Vct6+5TUA1hSSEvbWGYdEHdXzVl47tQS63JJnRM
	 PqrxkYxR1IeoVhgvoPX89YDqRCv5khqstQBPsHEB1YNLc4c+lPOn9jW27poMV2Jsf1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jyGKAlov;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4074A606A688
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4074A606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jyGKAlov
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso41160201fa.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 03:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606011; x=1796210811; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=jyGKAlovcwZSdrD0MngFnWQGCgbR1bsNB9jg7IqxSmLK0XzoVhx8RwgXCJFWbH91hG
         dlLvGqU0Ihq4/jX4SM6J0XYFj1elFigqBzomfWLEQ/aFm/f+wJFvfrrja5wACD50Bsee
         ZfrnMhBo9IsKKG35FUjvaF6cSWSoFpkmcd+tLlvjNOn6TqYjwqTb42gMU5RJEaMSosHD
         ClXTTley3jUlB5UwPfbQADiM+1xHBP57dQtvUL4QTDI/vji0BuUmXPtUOHeFgvmoZ2Zp
         vOzd1ZTu/5FSppLJJD57ABv+WATKIGZ5Ex2mJoFfcPj7HAPaNlX8poONISTTeBAxgnY4
         vZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606011; x=1796210811;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRclfZYhhBxZP+A+j93wjj/C0PGTAw+1g6Nws5prpWE=;
        b=MqSIs6f3InzVjIFwDLqeT5w7l65V6co4+WlFdHtAg1dIcwHqK+X+3iPLnM0tSO3mfr
         zVTZa0IJvwLOn9Gec8KiMcQWYOyaZ+O9VV0ems8ZwPENG+WL/786lQLj1naKSukm9U6+
         6u2O3y0dKNxKWPBh0x7PAZONwfZbPLhF5V1q4PxVwB3wB8B4t0qf3WIFi86v8O6QWoZF
         aeSlUjs7OU++8UlTWodrXXR6NdJlIDRcuIuDQb5AL3p4mhioVYhiFUxdQzvB0xlTrdkN
         MUJqXC67PY50+GHC4myM/5ld+aBqWd2DYgJqKFwOVR2mWF9+7XS2bTBGhBgVSddw+pLu
         Y2Cg==
X-Forwarded-Encrypted: i=1; AL+hErHCDGyED8WM9I6Lbg6eu8FZpedrk1fcxDoFAQIuFXbGNT0llZvdg680p6le/edr3T+gtYlSjoJ6ois=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UgO/fGFn2m0+vHsoVFWbgu8FVm3G23k4TB1XDxDmqwyJoX753
	+5lB426SjtnRT3drD68MHrZTK6285wK7IwplbIIzZCbsv8OT+0lJc5im
X-Gm-Gg: AZFdTZe8TpgE+emZH2XyLoICMhJPlp7xlFJ5f4YVo58Cs31tmwHKe1tpVTC1jZbR3/9
	kfNOlKs31xHwqXFyfZg7Lr0AmKLC30K3cQ9UBUCTJfYyxN6Xp+4ntPLvIYQMO0DX0hrAfBD5Aeq
	fkeLmuuAltQjVZQMM2wbKM5BQRRbvRTKBbgT6yWTdY50NlKsNUlFLWa66bf+3JD8whjc8fZGbHC
	fK1ppqEuH96uhDUT2r1Az+ywnAP/zznRSPQVcVNTJ/M1wl+rCA2+uI6fOam4QXdK8Db2CBJbOPz
	pSJwBhC6eM+ZsblCi+Nb/Ubuc0/9sotGDcPIsbex51SLbGyImCkX3D2C/NrABNM+2nFmK5WKgla
	rT2rPY7Yyv09dAXYSRlmaglVCv0HpDgbJiQ4s0npKDCwivtFRsnESrnTzBTJqQq29dOBqEyOseM
	+W65LIns6AO8HSUdx2c5ZnN+CDYriYoeJZXYEx4BGrlM8T2TVzlglW3CzPVPqg0+dS6uEcKhLk4
	Bzv6vy6mZTvOXvfwr0/O0TQ2GkrFF0+E2v9LiG2gnv9qyNsWuSrR1HddPVw1zxJt0p3HHeJxVbS
	N6M8arfW9P/Sf5HdB5lXkH0gWBNEyCDWj4zxAyvfol8wmIIHYcKH1pM=
X-Received: by 2002:a05:651c:b28:b0:39c:624d:82b9 with SMTP id 38308e7fff4ca-3ae7f9a073amr54848531fa.4.1795606011279;
        Wed, 25 Nov 2026 03:26:51 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e3c4sm46556431fa.4.2026.11.25.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH v4 4/6] reset: Add Cortina Systems CS7542 global reset controller
Date: Wed, 25 Nov 2026 14:26:28 +0300
Message-ID: <179560598858.3.3579752078270188660@gmail.com>
In-Reply-To: <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
References: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
 <20261125-cs7542-syscon-v4-4-3337bb0d3b48@gmail.com>
 <3b8b8d154a841d80de20d31c32b2fb4faba11480.camel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Philipp,

Thanks. I've switched the allocation in cs7542_reset_probe() to
devm_kzalloc_obj(dev, *rst) for the next revision.

Best regards,
Fil
