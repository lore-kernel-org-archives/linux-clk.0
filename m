Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348994;
	b=AORVGdO2V0SZCnzaIXzwVNrbtKlV10orBrt56iwJyFKsb3zLMfea9Jf09HqB+JKsldn4
	 yhRFaFsqr/+akKyW0Wp0e2eCVJpaHxQ3db3GGpDCRwVw8+g1jM5ctuhOYqWDvtzFkT1nT
	 CScpmfyRM/v87mJqZnFXUGqJMqx3b+dPveIFnsqNbYFQH6IxRgSGUrFZJqdytEGtjBOqn
	 bx7TSCI2KhOSprNyTzNBG4K20996MCDQil698lXGMrycQ3UOik/bbshy2WC4jFG6I6ajA
	 5+bbq7g8exHQTiXyHcDKZXLrTsllfdI6wsvz3PVvCXuqdC5w0CjpuVVhQs7fHjyA+VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348994;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=vn07bY4uFq8PBN9qP0CTPo9LlrFGbj9n/s2CEOTDmkk=;
	b=4OWy4Xf/aO9iXp9vXQGWXgfI20FD5A2W3SA4qi3clUTcTHy0WYXq/SkTBFly8SqfzGbj
	 3ze/RPVQ6aYzXIZ3g20dDTyJg0J2liDk4ehBe2yI6k4Z6QPGkVLCqlbQamRGFdFyGx+Gd
	 iZWFm++MsWQdYTdewAV7zfYSRge0QpghVn/1alb7fji2/hnv5z1mGunrh1SzncmtXVjBl
	 II8zUIaj2xq8A7bMJDemMfeO4uf+qH4tsJDBq3WHTRp26b7Du0aBwBC7+rgyCjcpcXTGr
	 mrjNpZBSzFoxxKJmwupqqsTpU51/QuR+KkvDCn7PScuFvRGTTnxgjwSoQ87qHQlaoew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1YVGmnIV;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26E606A327
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 08:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE26E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1YVGmnIV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 095AA1A13BC;
	Fri, 30 Oct 2026 08:29:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8F2C603C2;
	Fri, 30 Oct 2026 08:29:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E481D103287DA;
	Fri, 30 Oct 2026 09:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793348988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vn07bY4uFq8PBN9qP0CTPo9LlrFGbj9n/s2CEOTDmkk=;
	b=1YVGmnIVJ/VGw/8am2qtF4gVWmQOXXUdPRTBtWLffB2F4tD0J/gsCNEb2wgBpm+ERAjaCK
	t7cxm0wENSDDmcaZLo7LYOaGIX7EzMua+cqumo/4wpKpuZe0eHkPcd4Y2q1Vsv1UaUUnJX
	wGX8RAla0NvRuq1i2KuP36tDaSjiXtbW9DDMQKJmBVd/lwW3YFteIkrEZm5fv7sIqaecS/
	p2fZ2e+YTh+AH+gvnY+FhqbWKlAm656hNCLl6m9VM+LQ9MiOmhJJu1iXxoIrzk0+b0GSaG
	XuRcEa5Y8w4fDVljtFV7e2v7S3D7KkHe9jmn01+VA7LQRczCbylGL7n2nr2J8A==
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
Subject: Re: [PATCH v10 2/9] drm/bridge: fsl-ldb: Get the next non-panel
 bridge
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>, Frank Li <frank.li@oss.nxp.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261006-dcif-upstreaming-v10-2-bcfb28de0aae@oss.nxp.com>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-2-bcfb28de0aae@oss.nxp.com>
Date: Fri, 30 Oct 2026 09:29:39 +0100
Message-Id: <179334897994.680709.5849266352850173475.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello Laurentiu,

> The next bridge in bridge chain could be a panel bridge or a non-panel
> bridge.  Use devm_drm_of_get_bridge() to replace the combination
> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
> to get either a panel bridge or a non-panel bridge, instead of getting
> a panel bridge only.

Since commit b7797081ccfe ("drm/panel: embed a drm_bridge into every
drm_panel") there is no such thing as a panel_bridge. Now every panel just
embeds a bridge, and there is no reason to use the panel_bridge API. All
bridges/encoders/whoever needing to interact with "the next component, be
it a bridge or a panel" should just use the bridge API.

The old panel_bridge APIs are deprecated [0] and by now they are just
complicated wrappers to the bridge API.

I'm addressing the conversion to bridge API and eventual removal of the
deprecated panel_bridge API as time permits (but pathces would be
welcome). This driver has already been converted by commit 802372cf316a
("drm/bridge: fsl-ldb: don't create a panel_bridge"), so this patch is
basically not changing anything: it's still getting a pointer to the next
bridge, but switches to a slightly more complicated implementation.

So I'd drop this patch.

Still it's good to get rid of the obsolete "panel" wording because now we
don't interact with a panel aymore, see below.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/Documentation/gpu/todo.rst#remove-panel_bridge-api-functions

>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 7ec84c81cd78..52ae7f5b63c7 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -294,8 +294,8 @@ static const struct drm_bridge_funcs funcs = {
>  static int fsl_ldb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *panel_node;

This could be renamed remote_bridge, or next_bridge_node, or the like.

>  	struct device_node *remote1, *remote2;
> +	struct drm_bridge *next_bridge;
>  	struct fsl_ldb *fsl_ldb;
>  	int dual_link;
>
> @@ -318,19 +318,16 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	if (IS_ERR(fsl_ldb->regmap))
>  		return PTR_ERR(fsl_ldb->regmap);
>
> -	/* Locate the remote ports and the panel node */
> +	/* Locate the remote ports. */

This is OK.

>  	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
>  	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
>  	fsl_ldb->ch0_enabled = (remote1 != NULL);
>  	fsl_ldb->ch1_enabled = (remote2 != NULL);
> -	panel_node = of_node_get(remote1 ? remote1 : remote2);

I'd leave it as is, it's just less code (and more efficient FWIW)
than... see below (*)

>  	of_node_put(remote1);
>  	of_node_put(remote2);
>
> -	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> -		of_node_put(panel_node);
> -		return dev_err_probe(dev, -ENXIO, "No panel node found");
> -	}
> +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled)
> +		return dev_err_probe(dev, -ENXIO, "No next bridge node found");

This can be simplified by using a clenaup action on panel_node (or whatever
the new name will be), so the of_node_put() would disappear. See for
example commit 23bc92902edd ("drm/mxsfb/lcdif: simplify ep pointer
management using __free").


> @@ -339,10 +336,14 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"))
>  		fsl_ldb->use_termination_resistor = true;
>
> -	fsl_ldb->bridge.next_bridge = of_drm_find_and_get_bridge(panel_node);
> -	of_node_put(panel_node);
> -	if (!fsl_ldb->bridge.next_bridge)
> -		return -ENODEV;
> +	next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node,
> +						    fsl_ldb->ch0_enabled ? 1 : 2,
> +						    0);

(*) ...this code.

> +	if (IS_ERR(next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	fsl_ldb->bridge.next_bridge = next_bridge;
>
>  	if (fsl_ldb_is_dual(fsl_ldb)) {
>  		struct device_node *port1, *port2;

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

