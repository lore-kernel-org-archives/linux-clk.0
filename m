Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDC534751F
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123510; cv=none; b=ghehKwODIuFYEMs35Q1epEMu7iyclnZRvRU/W86InykYcrGNHrR+HOAOJh0VGYZ0HWtO1DAxqLOaPzCtrF9wHbRz7Nv0UnrXKRuLC7K+ejaRkSEYQEYyua4CvQG9QAOAkh9sL04lAehKG9zwRRiCxRXewTvngpJJN8UdLNwhWJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123510; c=relaxed/simple;
	bh=kZ88HTAYqn6Uqt+Vn8r/dUG7HeAYQelNU4ppeaLBhTE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=T3h+EvQcdXeEsxhyJqN5u29zO6hfnNoY1Vc8zWqLUPDa+hvo3qSNA+RgrZYLK/+99ZlSxHJCpsyKktt4IeaAV1sATY0bk54qcZLrt5435Q1ad1O/dz5jOzI4SDDlBqV+cbd6yPnenqtL+bLgmc0PzWsdqY5trpBjg8vEIXT/yxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y1gX10Oh; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y1gX10Oh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 60278C2B9EA;
	Mon, 18 May 2026 16:59:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 873FB5FFA3;
	Mon, 18 May 2026 16:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C672211AF8B49;
	Mon, 18 May 2026 18:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779123507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kZ88HTAYqn6Uqt+Vn8r/dUG7HeAYQelNU4ppeaLBhTE=;
	b=Y1gX10OhNAMpdiJ5tHNSwKjyXxAWGEtAdhVk+57Nr0m3j2qQjzRkJKF8tJ4AYxpZJembOf
	plxn/PHIxBq1YZyHqymUQ26iais7HeFUw29lIJuDoo4z4hDyn74ab0eVlqX/+/DwCzfKOn
	HfoCoOsiYYrBFZ5gjev9bYFtrchljDUC6RAJ2pvOw1osm3ct6b9HjaASfwxlMgP0mJD1YW
	gYFQCLlr/Q5ObBRI4rQuRGK1Q9CpjUL2qLFPbbhUGMvwcfOSuXHhb79aeOCD0Dq4NWKPyF
	49vxoky5dCa/QOnbQCCSzljW/DqCldfMd3sUZ/1dHq0JLDqqKUUP+knuucQCSQ==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 18:58:25 +0200
Message-Id: <DILYNB4NKBLQ.Z81MHL7G7FB6@bootlin.com>
Subject: Re: [PATCH v1 2/2] clk: Use named initializers for arrays of
 i2c_device_data
Cc: "Max Filippov" <jcmvbkbc@gmail.com>, "Alex Helms"
 <alexander.helms.jy@renesas.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
 <3a193d91e64703892900b62709bd1a67f540f39b.1778857289.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <3a193d91e64703892900b62709bd1a67f540f39b.1778857289.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri May 15, 2026 at 5:10 PM CEST, Uwe Kleine-K=C3=B6nig (The Capable Hub=
) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>
> While touching all these arrays, unify usage of whitespace and commas.
>
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # clk-versaclock5

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
