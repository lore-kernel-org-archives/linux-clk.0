Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02535C69C
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404494; cv=none; b=Z4NkNWuUxNsUKy0FHjT9NCrkBZO2o71Tgn9QBEraYGELgIn3lc+fczTt08huiWxv0EXsDY7fWDYs6lF3eQg2F0zx2tXHTZ4cVM65Tv6RJSvkzsa69UUz2/TKHI25CN0X83Oe3MIh7YagKyhMeNTKNthz3p5u4eERi0EpinYr85g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404494; c=relaxed/simple;
	bh=nQv1E13YkzPalp5ZoDTBV98THL9e7wpxBV655wN/rkg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gXa3iyuyefJN8TlgYwZOQGezZyIJvU7we0H4RSQsa98N3TGOZpZY6O96ANes/RrAZ68NjhNYozHcv2UqvuJnh8GgxWt539NJBeXxDb85+X0d3nAR9qwa8AziJqDuTYBFcGr0JYYMUBbdwotyzJDWteSagEE+19YDBdkdae9y2Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JebCuIr7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JTKwblkb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JebCuIr7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JTKwblkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789404491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
	b=JebCuIr7tu9SkaqbnNkJI/ROEfRlqnFx6ny2RTMfG6rDbY8BhiRRsFfVcIeUN329pFmHYe
	oBPFwejP7hsO8l7rY1MC+QF8Mt6bQh9u4hu11JY0UiIL9QgB4wwX/xCYwn6bvKPqw7pzFa
	2nCc8JAv0ZLrGuI3Xtzj5cnCNYC+maE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-kYmBI5fjMHqy-krTGOr_4w-1; Mon, 14 Sep 2026 12:48:09 -0400
X-MC-Unique: kYmBI5fjMHqy-krTGOr_4w-1
X-Mimecast-MFC-AGG-ID: kYmBI5fjMHqy-krTGOr_4w_1789404489
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e869793d3so72958266d6.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789404489; x=1790009289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
        b=JTKwblkbjNft4wxQZLZyfktXVNAQaMzWglSwDkR271lZCcMytCf+CzR8amCFhPtaB/
         1fbQjxvzaTBtbB2bQnaDuYA/qu5r4xNsOxRqtu3GEZZFlgycPKJa/np7uWBGfmnxxXUp
         X0BeT+4LlUQA/pJIpQgcK2MJsE0fJ4Ocb6Aw0fzscqkfKVi3D1D0YcmcQpckP116+O9J
         GPEzB5n8Y3vRJaModFVpD6gSUwDqQUl+/CH50FI+CENvzCmqaFul9cailX3qeGHiep+H
         lqEAT58KpRT6TPq3qYZOIOTh1qcjq0OPZLG799BGNwZKxexbBmvjKuBKAfAQvg8FRa5L
         sCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404489; x=1790009289;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrOlDT7L1Dl8kz1yM8HMjcw+s4ZfZbKkhGl/ULkPQG8=;
        b=LZG6iy9bsL/NRPMWJq+3vdJZQHvSO7ddqfTqzciGvxX3856dZEG4t1DCx4pGfWEIDW
         6enRxRdOXtzJzkYB33R17bf1JozC3fwH+mNpekZFl7YiFAw7sUOv790SwPArfHEGzuSH
         d4XCpnB7lFVnjk2IkTRdx1zm9g1MhTewA5A6dk++VUYzEXq3YMBus75jOctKUhdMW9PE
         aNb02RzSZ4S3lacGHyX3QNaIhFuvpCzJPqgU/pJRQWK4wai8Mq2J5YijLK/Z0TxEOcJn
         XdRzcDpjdjGIQTzkUg7aTj/eY/sBgRHpHDH3LsXBGJnW6q8QEFdEK5PC3YNZ5an+v4PH
         vIkg==
X-Forwarded-Encrypted: i=1; AKwUvBwqYFHrCXy6gTZu8TLhIKGR1V3YBww/xp2QKfo7kOgbWmFT8yNM+OGfTmYpZ7cX4DgAnFlGZa5DbAA=@vger.kernel.org
X-Gm-Message-State: AFuF++mcQyApw+jNZC7s3WvyStsqe9Axb9geN2MXutqhSVM9Sc6isxQh
	/ZDkwMUbwq4G+J7f28DIBryGnr/XCQOj1k693Ied6t2jzvdP/S2dex91rCjGpaujRHz2/f8Ug2W
	vFaxDHCwRtuxoDau29tI1a2/hVze7OwDmzGulF5kTJWkxYmilb8w8AtNZ1Toph+NTHclZjD1JQ4
	qNe9hQ6VeekxwjxuVnUeRAtwwi6fgHg9ioKk4xQQNRG15t
X-Gm-Gg: AYBFou159wHp3zDlr0WS4iP1h8UW9e5BJWiOnTF5cD1lbcZfhogBy1O5zK56fNtgvG8
	lJLti/U8uiIT5zTk8qgnqk9sgE303FQHIQxWodnz0DgHgm3vccTSrqjp+skzccIkYkGEbhN7y5G
	5OWj/0wtShSajgF9Q9/0bizMbkJKsNli78Jy99dzV3jV6bEIxtYgbWEQqclMYi+1znplnR/UGwI
	mcfZHxTWpus8vqekRm1rS5vTkTlk+GYU9yHjOx1xucrV2Ew4m492YPiCcgDv/neouvMAf/QDk6J
	aZdgP7jAzEV1wqcK4GgvkTMug4CGJNLc0UfoODb7q4b3Fo4OJC8oYaOL1nzWoE307D+OC5V8xMM
	mS6ag0nXlBFOao7yMHmzpDq+ZHta5xJyw6Q3r+1n7
X-Received: by 2002:a05:622a:1195:b0:530:cf10:8a97 with SMTP id d75a77b69052e-5310d028105mr51736391cf.38.1789404488767;
        Mon, 14 Sep 2026 09:48:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:530:cf10:8a97 with SMTP id d75a77b69052e-5310d028105mr51735621cf.38.1789404488088;
        Mon, 14 Sep 2026 09:48:08 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm104363801cf.9.2026.09.14.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:48:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org, 
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
References: <20260914142039.31654-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek Clock Drivers
 submaintainer
Message-Id: <178940446474.51095.501258130718058993.b4-ty@b4>
Date: Mon, 14 Sep 2026 12:47:44 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=344; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+LRTP52U/oWNmbfVd/dRn41R6JZhfEc41nXAbJPqOy0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJWqLosfyA364GJ7ESnXd/ZO36fyFZiL+eeKfRCIcPde
 5vTPIuXHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkRTzDf8/S522nJQuW7m18
 cTj25s9nGxdedWLcpWzh2H3f8lH76zSG/9EhGXrvHDkW9/b4PzzBJx0qcPSXa/hRN+9URgNdRjd
 bbgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Mon, 14 Sep 2026 16:20:39 +0200, AngeloGioacchino Del Regno wrote:
> MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer

Applied, thanks!

[1/1] MAINTAINERS: Add Angelo as MediaTek Clock Drivers submaintainer
      commit: 6b838130d2759008f8e8a80093c9eb6fcd435707

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

