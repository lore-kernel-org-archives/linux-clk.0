Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13644B0E21;
	Wed, 14 Oct 2026 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981345; cv=none; b=k66p//uh/Upzkp7HixUPi0QbWcM19yStxCegwVpgV7EevoyvaA1WlDJMQhJOO4vko3wmk0c1eHzBei8x44kkB6XrVpykhEEuww2WjCk581x1G8zKb3l+/NueiJoofB20xPJJ0jHKaNhpl/w21MVrb5yx5hb4PbDvP9G+BwdSZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981345; c=relaxed/simple;
	bh=eYAsudhIkh5fP01VFsYIRJARcsNM5Cqe6y1YTR2I4AI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d8RbqnYE0LXmmArEp4jELGX9ntatFFWH/a+aS0vstFiOv3VJQMd6kNgMYLFSq9Nof3lxs+V5RMBk2ihgiZK16bSdOF3bSpWz+zopoJzxDZY+WIUFCI6WNrm7wOpqFpK+sc+yrAXkHnxjDswQhBXsEi73Gn8YDmD247wR5I5XQmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQVny4NA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQVny4NA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F83D1F000FF;
	Wed, 14 Oct 2026 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981343;
	bh=KB9hCzI4UzqAwjJziEpOPzHB6X+avlHHR5bDokBkb+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQVny4NAXxSX5s03nv9ujH/LfilIYdjL+M3OOvbYbCiGB0+K9Edcjyv538OHW8NzF
	 By+YPGmdLmAj+zvJnJqkcSloe+nlQZCwhwOvNVHM2fxbDVNcpKGXCNxRf/sjoKJeVG
	 aPQEoqZ0Me6w8gsdRFWfP903rNMKDlx0FNqof2cdylTz5w3JmuHkErcRO6mDuwhbFH
	 avJ8YexA4gJruHOw056kF67E+v5Z1ombUEdqj3vo50grmyCAqMfMa99mgxPTpWeqxW
	 ril6/VJrZGOAAQCTamN+aIHLB2WijAdvXmM02+GSVgWB1u1Z2ZULtmaZItG2G+7ysH
	 0r9sW1DgkFzmA==
Message-ID: <sashiko-outbox-171287@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:35:42 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] clk: qcom: Hardware undervolted on actual_rate lookup failure
- [High] clk: qcom: TOCTOU race in qcom_clk_dvfs_cleanup() leads to UAF
- [High] clk: qcom: permanent DVFS domain bricking on failed performance st=
ate
- [Low] cleanup: mixed goto-based error handling and __free() in qcom_clk_d=
vfs_resource_acquire()
--

commit f24ba5feffbb1fedbb7c842c732865ac4c8e3e69
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

    clk: qcom: Add clock-owned GenPD DVFS aggregation
   =20
    Clocks on Qualcomm SoCs need a minimum power rail performance state to
    operate at a given frequency. We currently leave this to clock
    consumers, so a driver has to know which power domains supply both the
    clock and its parents. This ties knowledge of the clock tree to
    individual consumers and doesn't protect other users that prepare or
    change the same clock without making those power requests.

> diff --git a/drivers/clk/qcom/clk-dvfs.c b/drivers/clk/qcom/clk-dvfs.c
> new file mode 100644
> index 0000000000000..e6490c4dab949
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-dvfs.c
> @@ -0,0 +1,574 @@
[ ... ]
> +static unsigned int
> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
> +{
> +	struct qcom_clk_dvfs_vote *vote;
> +	unsigned int level =3D 0;
> +
> +	list_for_each_entry(vote, &rail_voter->votes, node)
> +		level =3D max(level, vote->level);
> +
> +	return max(level, rail_voter->safety_floor_level);
> +}
[ ... ]
> +static int qcom_clk_dvfs_apply(struct qcom_clk_dvfs_rail_voter *rail_vot=
er,
> +			       unsigned int level)
> +{
> +	int ret;
> +
> +	ret =3D qcom_clk_dvfs_activate(rail_voter);
> +	if (ret)
> +		return ret;
> +	ret =3D dev_pm_genpd_set_performance_state(rail_voter->dev, level);
> +	if (ret) {
> +		rail_voter->safety_floor_level =3D
> +			max(rail_voter->safety_floor_level,
> +			    max(rail_voter->last_successful_vote_level, level));
> +		return ret;

[Severity: High]
Does this code permanently limit the DVFS domain after a failed update?

If dev_pm_genpd_set_performance_state() fails in qcom_clk_dvfs_apply(),
the failed level is incorporated into safety_floor_level.=20

qcom_clk_dvfs_aggregate() will then always return at least this level for a=
ny
future updates, forcing the domain to retry a known-bad state. This could
permanently break frequency scaling for the domain and leak a PM runtime
reference because the domain can never reach level 0 to suspend.

> +	}
> +
> +	rail_voter->last_successful_vote_level =3D level;
> +	rail_voter->safety_floor_level =3D 0;
> +
> +	return 0;
> +}
[ ... ]
> +int qcom_clk_dvfs_resource_acquire(struct clk_hw *hw,
> +				 const struct clk_resource_transition *transition,
> +				 void **cookie)
> +{
> +	struct qcom_clk_dvfs_clock *clock =3D to_clk_regmap(hw)->dvfs;
> +	struct qcom_clk_dvfs_transition *dvfs_transition __free(kfree) =3D NULL;
> +	struct qcom_clk_dvfs_vote *votes __free(kfree) =3D NULL;
> +	unsigned int level;
> +	size_t i;
> +	int ret;
> +
> +	if (!clock) {
> +		*cookie =3D NULL;
> +		return 0;
> +	}
> +
> +	dvfs_transition =3D kzalloc_obj(*dvfs_transition);
> +	if (!dvfs_transition)
> +		return -ENOMEM;
> +
> +	votes =3D kcalloc(clock->data->num_pd_indices, sizeof(*votes),
> +			 GFP_KERNEL);
> +	if (!votes)
> +		return -ENOMEM;
> +
> +	dvfs_transition->votes =3D votes;
> +	dvfs_transition->num_votes =3D clock->data->num_pd_indices;
> +	ret =3D qcom_clk_dvfs_find_level(clock->data, transition->new_rate, &le=
vel);
> +	if (ret)
> +		return ret;
> +
> +	for (i =3D 0; i < dvfs_transition->num_votes; i++) {
> +		unsigned int pd_index =3D clock->data->pd_indices[i];
> +
> +		ret =3D qcom_clk_dvfs_add_vote(&clock->rail_voters[pd_index],
> +						  &dvfs_transition->votes[i], level);
> +		if (ret)
> +			goto unwind;
> +	}
> +
> +	dvfs_transition->votes =3D no_free_ptr(votes);
> +	*cookie =3D no_free_ptr(dvfs_transition);
> +
> +	return 0;
> +
> +unwind:
> +	while (i--) {

[Severity: Low]
This isn't a bug, but does this function mix goto error handling with __fre=
e()?

It appears qcom_clk_dvfs_resource_acquire() uses __free(kfree) for
dvfs_transition and votes while also using a "goto unwind;" path for error
cleanup. The cleanup subsystem guide recommends converting either all resou=
rces
to scope-based cleanup or none, rather than mixing both paradigms in the sa=
me
function.

> +		unsigned int pd_index =3D clock->data->pd_indices[i];
> +
> +		qcom_clk_dvfs_remove_vote(&clock->rail_voters[pd_index],
> +					    &dvfs_transition->votes[i]);
> +	}
> +
> +	return ret;
> +}
> +
> +int qcom_clk_dvfs_resource_release(struct clk_hw *hw,
> +				 const struct clk_resource_transition *transition,
> +				 void *cookie,
> +				 enum clk_resource_change_result result)
> +{
> +	struct qcom_clk_dvfs_transition *dvfs_transition =3D cookie;
> +	struct qcom_clk_dvfs_clock *clock =3D to_clk_regmap(hw)->dvfs;
> +	int first_error =3D 0;
> +	unsigned int level;
> +	int ret;
> +
> +	if (!clock)
> +		return 0;
> +	if (result =3D=3D CLK_RESOURCE_COMPLETE) {
> +		ret =3D qcom_clk_dvfs_find_level(clock->data, transition->actual_rate,
> +					   &level);
> +		if (ret)
> +			first_error =3D ret;
> +	}
> +
> +	for (size_t i =3D 0; i < dvfs_transition->num_votes; i++) {
> +		unsigned int pd_index =3D clock->data->pd_indices[i];
> +
> +		if (!clock->votes[i].level)
> +			continue;
> +
> +		if (result =3D=3D CLK_RESOURCE_COMPLETE) {
> +			ret =3D first_error;

[Severity: High]
Can this undervolt the hardware on an actual_rate lookup failure?

If qcom_clk_dvfs_find_level() fails to look up the level for the new rate
(setting first_error to a non-zero value), this loop sets ret =3D first_err=
or.
Because ret is non-zero, it skips qcom_clk_dvfs_replace_vote(), leaving the
permanent vote at the old, lower level.=20

Then, the temporary high transition vote is removed. Because the hardware
is already running at the higher actual_rate, the resulting lower aggregate
voltage vote could cause an immediate undervolt.

> +		} else if (result =3D=3D CLK_RESOURCE_HW_CHANGED) {
> +			level =3D max(clock->votes[i].level,
> +				    dvfs_transition->votes[i].level);
> +			ret =3D 0;
> +		} else {
> +			continue;
> +		}
> +
> +		if (!ret) {
> +			ret =3D qcom_clk_dvfs_replace_vote(&clock->rail_voters[pd_index],
> +							 &clock->votes[i], level);
> +		}
> +		if (ret && !first_error)
> +			first_error =3D ret;
> +	}
[ ... ]
> +static void qcom_clk_dvfs_cleanup(void *data)
> +{
> +	struct qcom_clk_dvfs *dvfs =3D data;
> +
> +	for (size_t i =3D 0; i < dvfs->num_clocks; i++)
> +		dvfs->clocks[i].rclk->dvfs =3D NULL;

[Severity: High]
Can this race with consumer unprepare operations?

If a consumer holds a reference and unbinds, devres executes
qcom_clk_dvfs_cleanup(), which nullifies rclk->dvfs without taking the CCF
prepare_lock.=20

A concurrent clk_unprepare() could read the non-NULL pointer, and if
qcom_clk_dvfs_cleanup() then proceeds to destroy rail_voter->lock and free
memory, qcom_clk_dvfs_unprepare() would cause a use-after-free when it tries
to lock the destroyed mutex in qcom_clk_dvfs_replace_vote().

> +
> +	for (size_t i =3D dvfs->num_rail_voters; i-- > 0;) {
> +		struct qcom_clk_dvfs_rail_voter *rail_voter =3D &dvfs->rail_voters[i];
> +
> +		if (rail_voter->active) {
> +			dev_pm_genpd_set_performance_state(rail_voter->dev, 0);
> +			WRITE_ONCE(rail_voter->must_contribute, false);
> +			pm_runtime_put_sync_suspend(rail_voter->dev);
> +		}
> +		dev_pm_genpd_remove_notifier(rail_voter->dev);
> +		device_link_del(rail_voter->link);
> +		dev_pm_domain_detach(rail_voter->dev, true);
> +		mutex_destroy(&rail_voter->lock);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D7
