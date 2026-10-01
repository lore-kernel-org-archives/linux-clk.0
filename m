Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E44AE8B7
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844769; cv=none; b=uA4k+RBqtLsBcU5koXJkjMa6kShqjj+ByWmqeGNDjwwmIBCmn9d1x8KCMk/AJ+IP2T8OC6SqTxlJYBHVe/VLPyNj3nx+5C3ajE4Jk8jw7QIc8WOxcBvEaAQsZrwKlj2q/uP1/VUhvNuCsQ7TCxeCVvNGvMNDKuZfU9lSNSxJyOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844769; c=relaxed/simple;
	bh=aoLzZOMCzAOCOPkrrQLBypjhe2aLbOL5ucc0aOFIkUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EYcoFDWh1RJo3JhClsavCwPhN8n6lZtV7p6YcWkKstQ5SkwchV3nV5Q6Ic8YeuanugX6DnZWUbxPxzOioyWMLJI0rJ004On5Dxgs0ZxWMwgahZ/nX57rk94drMZ8uUZeznnz83MqAobykzfwPXKUFfRVkXkrnGGOpz/4bwg9UnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EX7/kNkQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EX7/kNkQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso39300505e9.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790844763; x=1791449563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XI99x6iXcwFo3VPCWbeND/NaXUPvhkaFwC0UtW3R7XY=;
        b=EX7/kNkQRXbZobGz8ZWRft9yY/Z44bS1q7BKlfoOQ2KFX8hSt1j1IO8DB6Y7QHfhG7
         mbzwJptHG54u5PnNFkWRnXuXO+aYm61q1x/JFsvcXwXjt/jP2UHxaD2PIhpghx/qE198
         S8WCA8kyWWtX5rL4jIZmhXpAwKO5E3mNqRSxznYZknPmSpHUw+MJ9EpP9fKftoqmAh0c
         qrXm7/68u5f2jpgbXJAHOBdmhYJGE/ncXvKtBz4EJn/rRu4c5B1fA93+WdahDPceZeu7
         lC+Q47Uki99bseTHVNozmk5hG4n1p2RPbBhLG2xZnbQmWGPz19vvZYXQ6v+ZThv4iCcI
         POrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844763; x=1791449563;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XI99x6iXcwFo3VPCWbeND/NaXUPvhkaFwC0UtW3R7XY=;
        b=yFHGI33jJLslymYFKt4m7GY4RzeHfNHst7lK9vEaYPPZvG2H/MdRO8fa5yfcWC0Ts+
         mv/DjUhH+zwPY/pwQOBGp0Qw/49daHMWSDpdFbJ0nGEaBjkpZX71i/4XDuZJ5967IRKY
         ZbPWHtayh7K9qYoAKrMMHnwzZTqrEGb24z8Iy2NhnxPoFvksFxg5WRhVf1BnfVCUrF0M
         sHRDeRauuHottMq6ugFUyo0nTDWn3UR+AmmyKNKP0dYKIJwDTN4G9A80uPJ+o5bWDBTg
         ebCrBYlaBRhbKDKRLVQ/49laqod2nfl55noHZJoKgv32BC8XOMpKxiQzxgvQoX3huWyI
         MX7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEeCWLfysXqN1x670g6wW8HVCgybu1KWxEceu8wn3xAiq75nRdEujpqk5FC+x5oAztqrX2FffVJmI=@vger.kernel.org
X-Gm-Message-State: AFuF++n/ehTc5wXoygL6Bczsi/uCm42jznWOzVn1+z2S3tEmkmN7WpSW
	iKAd2txNZwbob57UUzu74SdgOfZSdShkiT51q8g86Z06mojT0dlb1ysy2AXNR6ph6VnjLZ9IbIH
	V/nIx
X-Gm-Gg: AYBFou1yDQ5s7iFFOxHXneL3q43T57yGbgNl0HiABYHgnag/TeM7WKDVlp2IAUozj3M
	YCC6Ry7zAV0D/2cvPf0PKyf/MTUzekXgXhJH096xNnWPkM367yBeLBhCeQ/H9ticWCSllNo1qBG
	QU9nUO/jhE3k+AKxzmE6ymTFVYupteHWdIFnvjsFpR/t7GIIm1SCtLjx5qRNvSZEY2z2aGuwOxr
	z2wqtDuZxWbYXQz/hVUjSD/OaMh83ZdRbUSuUtF6OZ9u9AZ2tf37YD+ZKzmXCPq2iOngYv7s62n
	JbV5lUGkbZMRQ3BOuLdfQveVkeQd89/WsYOitAyetbSv7T08mi+WqYgAAqOmnZghrXB189N047J
	WwxHE/SBTe+etFuHOPrV6nzYcq7UKREHJjgpvVL4hJUZm9MJ9VAPYdz8xuZ+Iu//+MwmIom8oe4
	acKAUnCckc2p+8ctWa0hLUO/u2i+RMKcVT8vqY2jD0ZODMWjz73riMG1tnWODcsoj3SAJQ+DPed
	Ja0E+WHaos/TGmPzQ==
X-Received: by 2002:a05:600c:46cf:b0:4a0:1f9e:5f7d with SMTP id 5b1f17b1804b1-4a01f9e631bmr29144715e9.7.1790844763564;
        Thu, 01 Oct 2026 01:52:43 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2d732sm4569062f8f.33.2026.10.01.01.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:52:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Heiko Stuebner <heiko@sntech.de>
In-Reply-To: <20260930114907.153690-1-francesco@dolcini.it>
References: <20260930114907.153690-1-francesco@dolcini.it>
Subject: Re: [PATCH] clk: clk-gpio: do not blame the DT property on probe
 deferral
Message-Id: <179084474931.13445.4177948830664076778.b4-ty@b4>
Date: Thu, 01 Oct 2026 10:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=202; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=aoLzZOMCzAOCOPkrrQLBypjhe2aLbOL5ucc0aOFIkUA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFn75KPulQkmTVsq57DSbLvz7Mmxb/Y3dGs4n7zjdvuyV
 otzUMzBjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEyEOZvhn9lDJrV7Uu83Vufs
 Vi33fqS36fmik8UnCkW4Gz7O9J7l/IuR4VHt0z2/rGyLk5eaZNg9LD7VGH96z+Wfjx6GxgkVWTC
 8ZQcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-pile), thanks!

[1/1] clk: clk-gpio: do not blame the DT property on probe deferral
      commit: d7e7f791c1997f500ad8a9b1f7e0855d61011fd0

Best regards,
--
Jerome

