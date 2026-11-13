Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577760;
	b=Qa41S+K/Mb0DJ+vyKs5DmFYPM1Zl5dJkFftbgydv9MqFPlAfq1drq9qKiQoAB/sZxW4z
	 9QOzVolxTFNYt8Zr3LLkysdEG6UItNZS3uL/MuFe2VIb+f22ZszKWz6Kb9vSh7XkHy60E
	 XEs1lr/DqSLQDDn6jbGndFjYrJSpB2Ye/CTqX9q82N3Zv4HfNWMsWobYC0CFHR9K7Wvdf
	 op4uq0njbm9drN8vdvz1DwtSyY2ZoqSbguXp/Z0Eg4oHu9+ItFIHWDyRZI+P+ROSzfujH
	 FE+XP81yxuCMzEuexrNXZmWTwPmGAXNLRAOtmO4YMzFg6W40zim0zGQZnKCSZJEs2jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6mKcZAd9NMRyiOkDlvbqYYERhFh3G/8TS8qOE88jIQg=;
	b=n9kPP99HoQUAk5z8a1dPdQrg8SeEfgA+V9zCe6OcUcCMs5+QMU7JdPi4+/nclDcnctcj
	 tROjAIZfP7LjjwWW30gUh5lYQwiLVz4nUx0YWV537PDqWBwWYAzdiiSVJkWdftZsij4t+
	 CsHlV2UVJ3RJWgoO4FO+IxDOyQ2GyO2hJW0qcY4G8ldOzVcezDHtEq53JvFOMxdEdK1O5
	 WumGqwMKRCpTtEoj/2J+iBsZEjLTtHntKn0GM7xxbw/BTBOvZ0ldsLn9Pei7C9WydD7tt
	 sT8J+pW0FY9Loh3QIGz6kKQciTywG4xEs2lUG/G+DI03zIRpQN0R1qiPLZzy2uK4nPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VACMJQDm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543F60A263C
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VACMJQDm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806971F00926;
	Fri, 13 Nov 2026 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577759;
	bh=6mKcZAd9NMRyiOkDlvbqYYERhFh3G/8TS8qOE88jIQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VACMJQDmdQWb79ii7x3LP8Pzq+Zhvg6uE6QmswhyhkUuiYkqGBGfe684I7QQfRlDr
	 Sz/LwnfOgDg5jrmcc6i4XGzxTCnH/2cF3UNMyusYk/JNf60oc8KNCqS0F19V/U0C50
	 EVbmS957HR7zQaN7/EZRToShyAWw693fs0lNGSTbJgLDzIiYtmCCg1wydMHNTbkTYv
	 p3PKLWNR1has6uN1j0JPYWPyBhEOLybqUndftHsDBSVqQMp5tbOKXjW4NPuQ7dks2f
	 7SgvHvK6qM2UAEivv7J+Q+infKjkb1dOtiDcoVcuIMCBomSSPcdboKl2DimlWriJEC
	 9dD2jgBcsfPIw==
Message-ID: <sashiko-outbox-212926@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] firmware: arm_scmi: clock: discover clock
 domains on first use
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261113-b4-scmi-clk-on-demand-v1-1-7fd162097b57@oss.nxp.com>
References: <20261113-b4-scmi-clk-on-demand-v1-0-7fd162097b57@oss.nxp.com>
 <20261113-b4-scmi-clk-on-demand-v1-1-7fd162097b57@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:49:19 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] firmware: arm_scmi: refcount underflow in __scmi_enable_evt()
  on clock notify
--

commit 8fa43ba288f69bdf8d875f87946751f895ce422b
Author: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>

firmware: arm_scmi: clock: discover clock domains on first use

This commit defers SCMI clock domain discovery from protocol initialization
to the first operation on each clock, freeing the discovered arrays in an
instance_deinit callback.

> diff --git a/drivers/firmware/arm/scmi/clock.c b/drivers/firmware/arm/scm=
i/clock.c
> index 0278705d809e8..010b63b637030 100644
> --- a/drivers/firmware/arm/scmi/clock.c
> +++ b/drivers/firmware/arm/scmi/clock.c
[ ... ]
> @@ -1113,23 +1176,16 @@ static const struct scmi_clk_proto_ops clk_proto_=
ops =3D {
>  static bool scmi_clk_notify_supported(const struct scmi_protocol_handle =
*ph,
>  				      u8 evt_id, u32 src_id)
>  {
> -	bool supported;
> -	struct scmi_clock_info *clk;
>  	struct clock_info *ci =3D ph->get_priv(ph);
> =20
> -	if (evt_id >=3D ARRAY_SIZE(evt_2_cmd))
> -		return false;
> -
> -	clk =3D scmi_clock_domain_lookup(ci, src_id);
> -	if (IS_ERR(clk))
> +	if (evt_id >=3D ARRAY_SIZE(evt_2_cmd) || src_id >=3D ci->num_clocks)
>  		return false;
> =20
> +	/* No clock is discovered yet, so report the protocol level support */
>  	if (evt_id =3D=3D SCMI_EVENT_CLOCK_RATE_CHANGED)
> -		supported =3D clk->rate_changed_notifications;
> -	else
> -		supported =3D clk->rate_change_requested_notifications;
> +		return ci->notify_rate_changed_cmd;
> =20
> -	return supported;
> +	return ci->notify_rate_change_requested_cmd;
>  }
> =20
>  static int scmi_clk_rate_notify(const struct scmi_protocol_handle *ph,
> @@ -1157,10 +1213,23 @@ static int scmi_clk_set_notify_enabled(const stru=
ct scmi_protocol_handle *ph,
>  				       u8 evt_id, u32 src_id, bool enable)
>  {
>  	int ret, cmd_id;
> +	bool supported;
> +	struct scmi_clock_info *clk;
> +	struct clock_info *ci =3D ph->get_priv(ph);
> =20
>  	if (evt_id >=3D ARRAY_SIZE(evt_2_cmd))
>  		return -EINVAL;
> =20
> +	clk =3D scmi_clock_domain_lookup(ph, ci, src_id, false);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	supported =3D evt_id =3D=3D SCMI_EVENT_CLOCK_RATE_CHANGED ?
> +		    clk->rate_changed_notifications :
> +		    clk->rate_change_requested_notifications;
> +	if (!supported)
> +		return -EOPNOTSUPP;
> +
>  	cmd_id =3D evt_2_cmd[evt_id];
>  	ret =3D scmi_clk_rate_notify(ph, src_id, cmd_id, enable);
>  	if (ret)

[Severity: Medium]
Can this underflow r_evt->sources[src_id] in __scmi_enable_evt() when an
all-sources clock notifier is unregistered?

Because scmi_clk_notify_supported() now returns true for every clock when
the protocol supports the notification command,
scmi_register_protocol_events() leaves r_evt->sources[src_id] at 0 instead
of NOTIF_UNSUPP for clocks that do not support notifications.  When an
event is enabled for all sources (SRC_ID_MASK), __scmi_enable_evt() gets
-EOPNOTSUPP from scmi_clk_set_notify_enabled() for those clocks and leaves
their refcount at 0, while still succeeding overall if at least one clock
supports the event.  When the notifier is later unregistered, the disable
path in __scmi_enable_evt() only skips NOTIF_UNSUPP:

drivers/firmware/arm/scmi/notify.c:__scmi_enable_evt() {
	...
			} else if (refcount_read(sid) =3D=3D 0) {
				ret =3D REVT_NOTIFY_ENABLE(r_evt, r_evt->evt->id,
							 src_id);
				if (!ret)
					refcount_set(sid, 1);
			} else {
				refcount_inc(sid);
			}
			retvals +=3D !ret;
		}
	} else {
		for (; num_sources; src_id++, num_sources--) {
			sid =3D &r_evt->sources[src_id];
			if (refcount_read(sid) =3D=3D NOTIF_UNSUPP)
				continue;
			if (refcount_dec_and_test(sid))
				REVT_NOTIFY_DISABLE(r_evt,
						    r_evt->evt->id, src_id);
	...
}

Calling refcount_dec_and_test(sid) on the clocks left at 0 triggers a
refcount underflow warning and saturates r_evt->sources[src_id], causing
subsequent enable calls on those sources to hit the refcount_inc(sid) path
and report success without enabling notifications.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-b4-scmi-cl=
k-on-demand-v1-0-7fd162097b57@oss.nxp.com?part=3D1
