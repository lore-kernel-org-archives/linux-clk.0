Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587306;
	b=R6Pwndzi6Y6uBa3Uokm7DabeZFOWZJJHKMPHsJqFub/ipn+tBw1csjJfQxDejmZm5Gx0
	 ZPbTC7rfShmpd0R/+C9r+DFDwjJbS7fTftkcCX4BW5yPz38dhB4JXZqF23JxniBI+LyBL
	 6zJ4/oqdkCa6onDN7X0WX10GU6uypnwcGm6KSYLm72vzbcB53eBPuCbFuDl+megsdiMs4
	 0VOwCVFTQnfK2bZwFinFST3Xt+7/mgCQNi1AbayMyiXDk0Bz4glLpJnqNhNlTeWGyySCn
	 pwp+9m0wc0cTcGPLFrnLwuIa9Fy6wDF7NghO5fYG+9EwgUGyhpt6ChGyfPvR61YF2OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=diju7nMZ7RrO2JwXNL2Gmfo1/V8+vpxgCV8IBGHDJ9c=;
	b=H2sZJnAK1SMXyeHb3URI8Cwet+FPmw9Z7wjZA/Xgcp0SuZHbn7hJik4G/cMcW+eUSEoK
	 NGQTBr/TFYGt7c/nsDslIAn8Od+bEw7xA2BNcicWxWuVsfZAl9sdqXNUEOkcGZ9J2f5PV
	 e0X4bVKwyRWE2n5mUBBNpNIV+yY2bJn7ggYmlpWEJak60ax43sSy8Y6DynMVAm7qa2VxD
	 KMqCOlctADjm7Ykvjf9TOtqyYBFx97GhlmRi8GSOS0uaBzVarASGxRkZ5r7f1Gtd2Q963
	 beWmoJyTUX3IJBe/jk/RiuDCggikuK+PdTm7LKdI1Kg0gdgw0SNgbFw7Gc+9peGrRbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C7bqcdRi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2C7606A32C;
	Wed, 25 Nov 2026 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C7bqcdRi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172C01F000C4;
	Wed, 25 Nov 2026 06:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795587306;
	bh=diju7nMZ7RrO2JwXNL2Gmfo1/V8+vpxgCV8IBGHDJ9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C7bqcdRiixqj5KE0M4SyYeII4UbsBBJPVAPDQceV7uRJF13j+TwsiDXy5obPcyhOx
	 Y5f9EdpqiGNZM7CwfeAzkoBmdb2XxOPnpqJP+NBYqgHBuV+gyzCxvW2W6Twipog0yO
	 ZWRbK5Bqv6YMR7L4JaBN6y4dSvkWUS81RK7vklwrnzfNEEkmp4tF36uxXwmNi0jszm
	 AkV+pgRvqnmQwG07Sc0fDthS96i8UsNMjtjIM8BpEzhWieIeQs9wY5gDWaXIzcvSzd
	 rcAc6aEtAjShBunr7gx10dXecvWRfK26ml2bPVyEhFBaCPHIr89RlMGZ4YCb1/hTru
	 y/7Psu089YD5w==
Message-ID: <sashiko-outbox-232653@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] soc: mediatek: mmdvfs: add MT8196 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Echo Zhang" <echo.zhang@mediatek.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125060037.649659-6-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-6-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 06:15:05 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] soc: mediatek: mmdvfs: wrong bitmask in mt8196_hwccf_vote()
  prepare poll
- [Medium] soc: mediatek: mmdvfs: spurious update in mt8196_hwccf_vote()
  on zero delta
- [Medium] soc: mediatek: mmdvfs: premature devm_kfree() in
  mt8196_deinit_hw()
- [Medium] soc: mediatek: mmdvfs: 5-second udelay() spin in
  mt8196_hwccf_vote()
- [Low] soc: mediatek: mmdvfs: wrong comment in mt8196_hwccf_vote() and
  unused macros
--

commit ed153f3d0764b28cb3e0456d69d5fe0a30a25f4f
Author: Echo Zhang <echo.zhang@mediatek.com>

soc: mediatek: mmdvfs: add MT8196 support

This commit adds MT8196 MMDVFS platform data, OPP table parsing, and HWCCF
DVFS voter support for multimedia clock muxes.

> diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c b/drivers/soc/me=
diatek/mmdvfs/mmdvfs-mt8196.c
> new file mode 100644
> index 0000000000000..1075884791e45
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c
> @@ -0,0 +1,637 @@

[ ... ]

> +/* HWCCF timing constants */
> +#define MTK_WAIT_HWV_PREPARE_CNT	200
> +#define MTK_WAIT_HWV_PREPARE_US		1
> +#define MTK_WAIT_HWV_DONE_CNT		5000000
> +#define MTK_WAIT_HWV_DONE_US		1
> +#define MT8196_HWV_LEVELS		7
> +
> +/* HWCCF DVFS Voter control bits */
> +#define HWCCF_VOTER_ENABLE		BIT(0)
> +#define HWCCF_VOTER_REQ_VALID		BIT(1)
> +#define HWCCF_VOTER_ACK_VALID		BIT(2)

[ ... ]

> +/*
> + * mt8196_hwccf_vote - perform HWCCF DVFS voter operation
> + * @mmdvfs: MMDVFS device structure
> + * @user: user structure
> + * @level: target performance level (higher value =3D higher performance)
> + *
> + * Implement HWCCF DVFS voter logic using the standard voting sequence:
> + *
> + * 1. WRITE: issue vote to SET/CLEAR register based on OPP delta
> + * 2. PREPARE: poll hwv_set_ofs until HW accepts (200us timeout)
> + * 3. DONE: poll hwv_sta_ofs until operation completes (5s timeout)
> + *
> + * OPP encoding uses cumulative bitmasks where index =3D level_num - 1 -=
 level.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int mt8196_hwccf_vote(struct mmdvfs_device *mmdvfs,
> +			     struct mmdvfs_user *user, u8 level)
> +{
> +	struct mt8196_mmdvfs_data *mt8196_data =3D mmdvfs->data->platform_data;
> +	struct mmdvfs_data *data =3D mmdvfs->data;
> +	struct mmdvfs_mux *mux;
> +	struct mmdvfs_rc *rc;
> +	u32 mask, opp_mask;
> +	u32 val =3D 0, orig =3D 0, renew =3D 0;
> +	u8 index;
> +	int i =3D 0, ret =3D 0;

[ ... ]

> +	index =3D level;
> +	mask =3D GENMASK(6, 0) << mux->shift;
> +	opp_mask =3D GENMASK(index, 0) << mux->shift;

[Severity: Low]
This isn't a bug, but the function header comment above states that
"index =3D level_num - 1 - level", whereas the implementation uses
"index =3D level" directly.  Also, HWCCF_VOTER_ENABLE,
HWCCF_VOTER_REQ_VALID, and HWCCF_VOTER_ACK_VALID are unused.

> +
> +	/* Phase 1: Read current setting and calculate delta */
> +	ret =3D regmap_read(mt8196_data->hwv_regmap, mux->hwccf.hwv_set_ofs, &o=
rig);
> +	if (ret) {
> +		dev_err(mmdvfs->dev, "Failed to read HWV set register: %d\n", ret);
> +		goto hwv_fail;
> +	}
> +
> +	val =3D orig & mask;
> +	val ^=3D opp_mask;
> +
> +	/* Write to SET or CLEAR register based on delta direction */
> +	if (val > opp_mask)
> +		ret =3D regmap_write(mt8196_data->hwv_regmap, mux->hwccf.hwv_clr_ofs, =
val);
> +	else
> +		ret =3D regmap_write(mt8196_data->hwv_regmap, mux->hwccf.hwv_set_ofs, =
val);
> +
> +	if (ret) {
> +		dev_err(mmdvfs->dev, "Failed to write HWV register (ofs=3D0x%x): %d\n",
> +			val > opp_mask ? mux->hwccf.hwv_clr_ofs : mux->hwccf.hwv_set_ofs, ret=
);
> +		goto hwv_fail;
> +	}
> +
> +	/* Write UPDATE register to trigger hardware processing. */
> +	if (mux->hwccf.hwv_upd_id !=3D 0xFF) {
> +		ret =3D regmap_write(mt8196_data->hwv_regmap,
> +				   mux->hwccf.hwv_upd_ofs,
> +				   BIT(mux->hwccf.hwv_upd_id));
> +		if (ret) {
> +			dev_err(mmdvfs->dev, "Failed to write HWV update register (ofs=3D0x%x=
 bit=3D%u): %d\n",
> +				mux->hwccf.hwv_upd_ofs, mux->hwccf.hwv_upd_id, ret);
> +			goto hwv_fail;
> +		}
> +	}

[Severity: Medium]
Should mt8196_hwccf_vote() return 0 early when val =3D=3D 0?

Every mux in mt8196_mux_user_map is shared across multiple users, and
mmdvfs_set_rate() only skips calling hw_vote() when the calling user's own
user->level is unchanged.  When a user updates its vote while another user
on the same mux already holds an equal or higher vote, aggregated_level
matches what is already in hwv_set_ofs, so val is 0.  Without an early
return, this writes 0 to hwv_set_ofs, pulses BIT(mux->hwccf.hwv_upd_id) in
hwv_upd_ofs to trigger a hardware update transaction, and then exits Phase
3 without waiting because (renew & 0) =3D=3D 0 is always true.

> +
> +	/* Phase 2: Poll until hardware accepts the vote (200us timeout) */
> +	i =3D 0;
> +	while (1) {
> +		ret =3D regmap_read(mt8196_data->hwv_regmap, mux->hwccf.hwv_set_ofs, &=
renew);
> +		if (ret) {
> +			dev_err(mmdvfs->dev, "Failed to read HWV set status: %d\n", ret);
> +			goto hwv_fail;
> +		}
> +
> +		if ((renew & opp_mask) =3D=3D opp_mask)
> +			break;
> +
> +		if (i < MTK_WAIT_HWV_PREPARE_CNT) {
> +			udelay(MTK_WAIT_HWV_PREPARE_US);
> +			i++;
> +		} else {
> +			dev_err(mmdvfs->dev,
> +				"HWV prepare timeout(%d loops, %dus): renew=3D0x%x opp_mask=3D0x%x m=
ask=3D0x%x\n",
> +				i, i * MTK_WAIT_HWV_PREPARE_US, renew, opp_mask, mask);
> +			dev_err(mmdvfs->dev,
> +				"  mux_id=3D%u shift=3D%u hwv_set_ofs=3D0x%x renew&mask=3D0x%x\n",
> +				user->mux, mux->shift, mux->hwccf.hwv_set_ofs, renew & mask);
> +			ret =3D -ETIMEDOUT;
> +			goto hwv_fail;
> +		}
> +	}

[Severity: High]
Should the Phase 2 condition check (renew & mask) =3D=3D opp_mask instead of
(renew & opp_mask) =3D=3D opp_mask?

When lowering a mux OPP level, the lower bits in opp_mask were already set
in hwv_set_ofs by the previous higher level, while the upper bits in val
are being cleared via hwv_clr_ofs.  Masking renew with opp_mask ignores
those upper bits, so (renew & opp_mask) =3D=3D opp_mask succeeds on the fir=
st
read before the hardware voter clears the upper bits or latches the
downward vote, allowing Phase 3 to read pre-transition DONE bits in
hwv_sta_ofs and return before the transition completes.

> +
> +	/* Phase 3: Poll until operation completes (5s timeout) */
> +	i =3D 0;
> +	while (1) {
> +		ret =3D regmap_read(mt8196_data->hwv_regmap, mux->hwccf.hwv_sta_ofs, &=
renew);
> +		if (ret) {
> +			dev_err(mmdvfs->dev, "Failed to read HWV status: %d\n", ret);
> +			goto hwv_fail;
> +		}
> +
> +		if ((renew & val) =3D=3D val)
> +			break;
> +
> +		if (i < MTK_WAIT_HWV_DONE_CNT) {
> +			udelay(MTK_WAIT_HWV_DONE_US);
> +			i++;
> +		} else {
> +			dev_err(mmdvfs->dev,
> +				"HWV done timeout(%d loops, %dms): renew=3D0x%x val=3D0x%x\n",
> +				i, i * MTK_WAIT_HWV_DONE_US / 1000, renew, val);
> +			ret =3D -ETIMEDOUT;
> +			goto hwv_fail;
> +		}
> +	}

[Severity: Medium]
Can this Phase 3 loop use a sleeping poll such as
regmap_read_poll_timeout() or a bounded microsecond timeout instead of
spinning with udelay(1) for up to 5 seconds?

mt8196_hwccf_vote() is called from mmdvfs_set_rate() in sleepable process
context while holding mux->lock and the global clock framework
prepare_lock.  If the hardware voter is slow or times out waiting for
hwv_sta_ofs, 5,000,000 iterations of udelay(1) monopolize the CPU for 5
seconds without yielding and block all clock prepare and rate operations
system-wide.

[ ... ]

> +/*
> + * mt8196_deinit_hw - Deinitialize hardware
> + */
> +static void mt8196_deinit_hw(struct mmdvfs_device *mmdvfs)
> +{
> +	struct mmdvfs_data *data =3D mmdvfs->data;
> +
> +	if (data->platform_data) {
> +		devm_kfree(mmdvfs->dev, data->platform_data);
> +		data->platform_data =3D NULL;
> +	}
> +
> +	dev_info(mmdvfs->dev, "MT8196 HWCCF DVFS Voter deinitialized\n");
> +}

[Severity: Medium]
Can calling devm_kfree() in mt8196_deinit_hw() cause a use-after-free in a
concurrent mt8196_hwccf_vote()?

mmdvfs_probe() registers the user clocks via devm_clk_hw_register() after
mt8196_init_hw() allocates data->platform_data with devm_kzalloc(), and
mmdvfs_remove() invokes deinit_hw() before devres unregisters those clock
providers:

CPU0                                  CPU1
mmdvfs_set_rate()
  mutex_lock(&mux->lock)
  mt8196_hw_vote()
    mt8196_hwccf_vote()
      mt8196_data =3D
        mmdvfs->data->platform_data
                                      mmdvfs_remove()
                                        mt8196_deinit_hw()
                                          devm_kfree(...,
                                            data->platform_data)
      regmap_read(
        mt8196_data->hwv_regmap, ...)
        <-- use-after-free

Dropping the manual devm_kfree() lets devres free data->platform_data on
device release after the devm-managed clocks have been unregistered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125060037.6496=
59-1-echo.zhang@mediatek.com?part=3D5
